/**
 @author: Paurav Shah
 */

package com.springmvc.web.LoginApp.repository;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.springmvc.web.LoginApp.model.User;

@Repository
public class UserDAOImpl implements UserDAO {
	
	private Configuration conf;
	private SessionFactory factory;
	private Session session;
	private Transaction tr;
	
	// Save user registration details
	public void saveUser(User user) {
		conf = new Configuration().configure("hibernate.cfg.xml");
		factory = conf.buildSessionFactory();
		session = factory.openSession();
		tr = session.beginTransaction();
		session.persist(user);
		tr.commit();
		session.close();
	}
	
	// Get list of users with given email
	public List<User> getUserByEmail(String email) {
		conf = new Configuration().configure("hibernate.cfg.xml");
		factory = conf.buildSessionFactory();
		session = factory.openSession();
		tr = session.beginTransaction();
		@SuppressWarnings("rawtypes")
		Query query = session.createQuery("from User where email=?"); //HQL
		query.setParameter(0, email);
		@SuppressWarnings("unchecked")
		List<User> userList = query.list();
		tr.commit();
		session.close();		
		return userList;
	}
}
