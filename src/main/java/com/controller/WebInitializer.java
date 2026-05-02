package com.controller;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.configuration.Myconfig;

import jakarta.servlet.MultipartConfigElement;
import jakarta.servlet.ServletRegistration;

public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { Myconfig.class };
    }

    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }

    // ── REQUIRED: enables multipart/file upload support ──
    // Without this, resume upload will throw an error
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        // Max file size: 5MB, Max request size: 10MB, 0 = write to disk immediately
        registration.setMultipartConfig(
            new MultipartConfigElement(
                System.getProperty("java.io.tmpdir"),  // temp dir
                5 * 1024 * 1024,   // max file size = 5MB
                10 * 1024 * 1024,  // max request size = 10MB
                0                  // file size threshold
            )
        );
    }
}