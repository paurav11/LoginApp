package com.springmvc.web.LoginApp.repository;

import java.util.List;

import com.springmvc.web.LoginApp.model.User;

public interface UserDAO {
	public void saveUser(User user);
	public List<User> getUserByEmail(String email);
}
