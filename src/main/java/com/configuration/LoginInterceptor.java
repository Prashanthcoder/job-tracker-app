package com.configuration;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;

/**
 * LoginInterceptor — redirects unauthenticated requests to /login.
 *
 * Register this in Myconfig.java (see addInterceptors snippet below).
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response,
                             Object handler) throws Exception {

        HttpSession session = request.getSession(false);
        boolean loggedIn    = (session != null && session.getAttribute("loggedInUser") != null);

        if (!loggedIn) {
            response.sendRedirect(request.getContextPath() + "/login");
            return false;   // block the request
        }
        return true;        // allow through
    }
}