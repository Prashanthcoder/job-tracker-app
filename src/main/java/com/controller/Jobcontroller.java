package com.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.DataAccess;
import dto.JobApplication;

@Controller
public class Jobcontroller {

    DataAccess dao = new DataAccess();

    private static final String GROQ_API_KEY = System.getenv("GROQ_API_KEY");

    // ── STEP 2: Resume upload folder (auto-created if not exists) ──
    private static final String UPLOAD_DIR = System.getProperty("user.home") + "/jobtracker_uploads/";

    // GET "/" → Home page
    @GetMapping("/")
    public String home(Model model) {
        List<JobApplication> applications = dao.getAllJobs();
        model.addAttribute("applications", applications);
        model.addAttribute("job", new JobApplication());
        return "home.jsp";
    }

    // POST "/addJob" → Save new application + optional resume
    @PostMapping("/addJob")
    public String addJob(
            @RequestParam("company_name")     String company_name,
            @RequestParam("role")             String role,
            @RequestParam("applyDate")        String applyDate,
            @RequestParam("status")           String status,
            @RequestParam("application_type") String application_type,
            @RequestParam("job_description")  String job_description,
            @RequestParam(value = "resumeFile", required = false) MultipartFile resumeFile) {

        JobApplication job = new JobApplication();
        job.setCompany_name(company_name);
        job.setRole(role);
        job.setApplyDate(applyDate);
        job.setStatus(status);
        job.setApplication_type(application_type);
        job.setJob_description(job_description);

        if (resumeFile != null && !resumeFile.isEmpty()) {
            job.setResume_path(saveResume(resumeFile, company_name));
        }

        dao.saveJob(job);
        return "redirect:/";
    }

    // POST "/deleteJob" → Delete application
    @PostMapping("/deleteJob")
    public String deleteJob(@RequestParam("company_name") String company_name) {
        dao.deleteJob(company_name);
        return "redirect:/";
    }

    // GET "/editJob" → Pre-fill edit modal
    @GetMapping("/editJob")
    public String editJobForm(@RequestParam("company_name") String company_name, Model model) {
        model.addAttribute("editApp", dao.findById(company_name));
        model.addAttribute("applications", dao.getAllJobs());
        model.addAttribute("job", new JobApplication());
        return "home.jsp";
    }

    // POST "/updateJob" → Save edits
    @PostMapping("/updateJob")
    public String updateJob(
            @RequestParam("original_company") String originalCompany,
            @RequestParam("company_name")     String company_name,
            @RequestParam("role")             String role,
            @RequestParam("applyDate")        String applyDate,
            @RequestParam("status")           String status,
            @RequestParam("application_type") String application_type,
            @RequestParam("job_description")  String job_description,
            @RequestParam(value = "resumeFile", required = false) MultipartFile resumeFile) {

        JobApplication updated = new JobApplication();
        updated.setCompany_name(company_name);
        updated.setRole(role);
        updated.setApplyDate(applyDate);
        updated.setStatus(status);
        updated.setApplication_type(application_type);
        updated.setJob_description(job_description);

        JobApplication existing = dao.findById(originalCompany);
        if (existing != null) updated.setResume_path(existing.getResume_path());

        if (resumeFile != null && !resumeFile.isEmpty()) {
            updated.setResume_path(saveResume(resumeFile, company_name));
        }

        dao.updateJob(updated, originalCompany);
        return "redirect:/";
    }

    // POST "/aiInsights" → Groq career advice
    @PostMapping("/aiInsights")
    public String aiInsights(
            @RequestParam("company_name") String company_name,
            @RequestParam("role")         String role,
            @RequestParam("status")       String status,
            @RequestParam("job_desc")     String jobDesc,
            Model model) {

        String prompt = "You are a senior career coach specializing in tech and software engineering.\n\n"
            + "A job seeker applied to: " + role + " at " + company_name + ".\n"
            + "Current status: " + status + ".\n"
            + "Job description: " + jobDesc + "\n\n"
            + "Provide concise, actionable insights in exactly these 3 sections:\n"
            + "1. PREPARATION TIPS (3 bullet points for interview prep specific to this role)\n"
            + "2. KEY SKILLS TO HIGHLIGHT (3 skills from the JD they should emphasize)\n"
            + "3. NEXT STEP ADVICE (1 clear action based on current status: " + status + ")\n\n"
            + "Keep it practical, specific, under 200 words total.";

        model.addAttribute("applications", dao.getAllJobs());
        model.addAttribute("job", new JobApplication());
        model.addAttribute("aiInsight", callGroqAPI(prompt));
        model.addAttribute("aiCompany", company_name);
        return "home.jsp";
    }

    // POST "/atsScore" → Groq ATS analysis
    @PostMapping("/atsScore")
    public String atsScore(
            @RequestParam("company_name") String company_name,
            @RequestParam("job_desc")     String jobDesc,
            @RequestParam("resume_text")  String resumeText,
            Model model) {

        String prompt = "You are an ATS (Applicant Tracking System) expert.\n\n"
            + "Job Description:\n" + jobDesc + "\n\n"
            + "Candidate Resume/Skills:\n" + resumeText + "\n\n"
            + "Respond ONLY in this exact format, no extra text:\n"
            + "SCORE: [number 0-100]\n"
            + "MATCHED_KEYWORDS: [comma separated keywords found in both JD and resume]\n"
            + "MISSING_KEYWORDS: [comma separated important JD keywords missing from resume]\n"
            + "IMPROVEMENT_TIP: [one sentence actionable tip to improve the resume]\n\n"
            + "Be strict and realistic with the score.";

        model.addAttribute("applications", dao.getAllJobs());
        model.addAttribute("job", new JobApplication());
        model.addAttribute("atsResult", callGroqAPI(prompt));
        model.addAttribute("atsCompany", company_name);
        return "home.jsp";
    }

    // HELPER: Save resume file to disk
    private String saveResume(MultipartFile file, String companyName) {
        try {
            File dir = new File(UPLOAD_DIR);
            if (!dir.exists()) dir.mkdirs();
            String safeCompany = companyName.replaceAll("[^a-zA-Z0-9]", "_");
            String filename    = safeCompany + "_" + file.getOriginalFilename();
            Files.write(Paths.get(UPLOAD_DIR + filename), file.getBytes());
            return filename;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // HELPER: Call Groq API (free, ~200ms response)
    // Uses llama-3.3-70b-versatile model
    // OpenAI-compatible endpoint
    private String callGroqAPI(String userPrompt) {
        try {
            URL url = new URL("https://api.groq.com/openai/v1/chat/completions");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Authorization", "Bearer " + GROQ_API_KEY);
            conn.setDoOutput(true);
            conn.setConnectTimeout(15000);
            conn.setReadTimeout(30000);

            String escaped = userPrompt
                .replace("\\", "\\\\")
                .replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r")
                .replace("\t", "\\t");

            String body = "{"
                + "\"model\":\"llama-3.3-70b-versatile\","
                + "\"messages\":[{\"role\":\"user\",\"content\":\"" + escaped + "\"}],"
                + "\"max_tokens\":600,"
                + "\"temperature\":0.7"
                + "}";

            try (OutputStream os = conn.getOutputStream()) {
                os.write(body.getBytes(StandardCharsets.UTF_8));
            }

            int code = conn.getResponseCode();
            BufferedReader reader = new BufferedReader(new InputStreamReader(
                code == 200 ? conn.getInputStream() : conn.getErrorStream(),
                StandardCharsets.UTF_8));

            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) response.append(line);
            reader.close();

            if (code != 200) {
                return "Groq API Error " + code + ": " + response.toString();
            }

            // Parse "content" field from OpenAI-compatible JSON
            // {"choices":[{"message":{"content":"TEXT HERE"}}]}
            String raw = response.toString();
            int start = raw.indexOf("\"content\":\"");
            if (start == -1) return "Could not parse Groq response.";
            start += 11;

            StringBuilder result = new StringBuilder();
            for (int i = start; i < raw.length(); i++) {
                char c = raw.charAt(i);
                if (c == '"' && raw.charAt(i - 1) != '\\') break;
                if (c == '\\' && i + 1 < raw.length()) {
                    char next = raw.charAt(i + 1);
                    if      (next == 'n')  { result.append('\n'); i++; }
                    else if (next == '"')  { result.append('"');  i++; }
                    else if (next == '\\') { result.append('\\'); i++; }
                    else if (next == 't')  { result.append('\t'); i++; }
                    else result.append(c);
                } else {
                    result.append(c);
                }
            }
            return result.toString();

        } catch (Exception e) {
            e.printStackTrace();
            return "Error contacting Groq: " + e.getMessage();
        }
    }
}