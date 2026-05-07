package com.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * LoginController — handles login / logout for JobTrack Pro.
 *
 * For a quick start, credentials are checked against hard-coded values.
 * Replace the authenticate() method with a real DB/service call when ready.
 */
@Controller
public class LoginController {

    // ── STEP 1: Replace with DB lookup (User entity + UserDAO) when ready ──
    private static final String DEMO_USERNAME = "admin";
    private static final String DEMO_PASSWORD = "admin123";

    /** GET /login  →  show login page */
    @GetMapping("/login")
    public String showLoginPage() {
        return "login.jsp";
    }

    /** POST /login  →  validate credentials */
    @PostMapping("/login")
    public String processLogin(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        if (authenticate(username, password)) {
            // Store logged-in user info in session
            session.setAttribute("loggedInUser", username);
            return "redirect:/";           // → home dashboard
        } else {
            model.addAttribute("loginError", "Invalid username or password. Please try again.");
            return "login.jsp";            // back to login with error
        }
    }

    /** GET /logout  →  invalidate session and redirect to login */
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    // ── Credential check — replace with real DB query ──
    private boolean authenticate(String username, String password) {
        return DEMO_USERNAME.equals(username) && DEMO_PASSWORD.equals(password);
    }
}