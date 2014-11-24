package com.cater.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.LoginDAO;
import com.cater.model.Login;

/**
 * Description: I validate login credentails.
 * Created: Nov 23, 2014
 * @author Hari 
 */
@Component
public class LoginService {
	@Autowired
	private LoginDAO loginDAO;

	/**
	 * Retrieve login for.
	 *
	 * @param username the username
	 * @param password the password
	 * @return the login
	 */
	public Login retrieveLoginFor(String username, String password) {
		if (StringUtils.isNotBlank(username)
				&& StringUtils.isNotBlank(password)) {
			return loginDAO.findByCredentials(username, password);
		}
		return null;
	}
}
