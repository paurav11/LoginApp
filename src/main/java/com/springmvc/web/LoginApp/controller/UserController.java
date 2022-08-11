package com.springmvc.web.LoginApp.controller;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class UserController {
	
	// Redirect to the login page
    @RequestMapping(value ="/", method = RequestMethod.GET)
    public RedirectView redirectToIndex() {
        return new RedirectView("http://localhost:8080/LoginApp/login");
    }

    // Login page
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView home() throws IOException {
		return new ModelAndView("login");
	}
	
	// Registration Page
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public ModelAndView register() throws IOException {
		return new ModelAndView("register");
	}
}
