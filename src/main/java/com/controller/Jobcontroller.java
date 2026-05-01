package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.DataAccess;
import dto.JobApplication;

@Controller
public class Jobcontroller {
	DataAccess dao = new DataAccess();
	
	@GetMapping("/")
	public String home(Model model) {
		List<JobApplication> applications = dao.getAllJobs();
		model.addAttribute("applications", applications);
		model.addAttribute("job", new JobApplication());
		return "home.jsp";
	}
	
	@PostMapping("/addJob")
	public String addJob(@ModelAttribute JobApplication job) {
		dao.saveJob(job);
		return "redirect:/";
	}
	
	@PostMapping("deleteJob")
	public String deleteJob(@RequestParam("company_name") String company_name) {
		dao.deleteJob(company_name);
		return "redirect:/";
	}
}


