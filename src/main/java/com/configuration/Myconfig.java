package com.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"com.controller", "com.configuration"})
public class Myconfig implements WebMvcConfigurer {

    // Tells Spring MVC where JSP files live
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/");
        resolver.setSuffix("");
        return resolver;
    }

    // REQUIRED for resume file upload to work
    @Bean
    public MultipartResolver multipartResolver() {
        return new StandardServletMultipartResolver();
    }

    // Serve uploaded resume files at /uploads/**
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String uploadDir = System.getProperty("user.home") + "/jobtracker_uploads/";
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:" + uploadDir);
    }

    // ── NEW: protect all routes except /login and /uploads/** ──
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns(
                    "/login",        // login page GET + POST
                    "/uploads/**"    // resume file downloads (no login needed)
                );
    }
}