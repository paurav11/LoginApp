package com.springmvc.web.LoginApp.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.springmvc.web.LoginApp.model.User;
import com.springmvc.web.LoginApp.repository.UserDAOImpl;

@Controller
public class UserController {
	
	private ApplicationContext conn;
	
	// Redirect to the login page
    @RequestMapping(value ="/", method = RequestMethod.GET)
    public RedirectView redirectToLogin() {
        return new RedirectView("http://localhost:8080/LoginApp/login");
    }

    // Login page
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public ModelAndView login() throws IOException {
		return new ModelAndView("login");
	}
	
	// Registration Page
	@RequestMapping(value="/register", method = RequestMethod.GET)
	public ModelAndView register() throws IOException {
		return new ModelAndView("register");
	}
	
	// Profile Page
	@RequestMapping(value="/profile", method = RequestMethod.GET)
	public ModelAndView profile() throws IOException {
		return new ModelAndView("profile");
	}
	
	// Check whether user is already available or not
	public boolean isUser(String email){
		List<User> userList = getUserByEmail(email);
		
		if(userList.size() == 0) {
			return false;
		}
		return true;
	}
	
	// Get user by email
	public List<User> getUserByEmail(String email){
		conn = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		UserDAOImpl userDAOImpl = conn.getBean("dao", UserDAOImpl.class);
		List<User> userList = userDAOImpl.getUserByEmail(email);		
		return userList;
	}
	
	// Save User
	@RequestMapping(value="/saveUser", method = RequestMethod.POST)
	public @ResponseBody ResponseEntity saveUser(@RequestBody Map<String,String> body) {
		
		if(isUser(body.get("emailId").trim())) {
			System.out.println("User exists!");
			return new ResponseEntity(HttpStatus.NOT_ACCEPTABLE);
		} else {
			String firstName = body.get("firstName").trim();
	        String lastName = body.get("lastName").trim();
	        String emailId = body.get("emailId").trim();
	        String mobileNumber = body.get("mobileNumber").trim();
	        LocalDate date = LocalDate.parse(body.get("dob").trim());
	        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	        String dob = dateFormatter.format(date);
	        String gender = body.get("gender").trim(); 
	        LocalDateTime currentDateTime = LocalDateTime.now();
	        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
	        String userCreatedOn = dateTimeFormatter.format(currentDateTime);
	        String password = body.get("password").trim();
			
			try {
				User user = new User(firstName, lastName, emailId, mobileNumber, dob, gender, userCreatedOn, password);
				System.out.println(user.toString());
				conn = new ClassPathXmlApplicationContext("ApplicationContext.xml");
				UserDAOImpl userDAOImpl = conn.getBean("dao", UserDAOImpl.class);
				userDAOImpl.saveUser(user);
			} catch(Exception e) {
				e.printStackTrace();
				return new ResponseEntity(HttpStatus.NOT_ACCEPTABLE);
			}
			return new ResponseEntity(HttpStatus.CREATED);
		}
	}
	
	// Verify User
	@RequestMapping(value = "/verifyUser/{email}/{password}", method = RequestMethod.GET)
	public @ResponseBody ResponseEntity verifyUser(@PathVariable String email, @PathVariable String password){
		if(isUser(email)) {
			List<User> userList = getUserByEmail(email);
			if(userList.get(0).getPassword().equals(password)) {
				return new ResponseEntity(HttpStatus.OK);
			}
		}
		return new ResponseEntity(HttpStatus.NOT_ACCEPTABLE);
	}
	
	// Get userId from email
	@RequestMapping(value = "/getUserId/{email}/", method = RequestMethod.GET)
	public @ResponseBody int getUserId(@PathVariable String email) {
		conn = new ClassPathXmlApplicationContext("ApplicationContext.xml");
		UserDAOImpl userDAOImpl = conn.getBean("dao", UserDAOImpl.class);
		List<User> userList = userDAOImpl.getUserByEmail(email);
		return userList.get(0).getId();
	}
}
