package com.cater.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.LoginDAO;
import com.cater.model.Login;

/**
 * Description: I validate login credentails.
 * @since Nov 23, 2014
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

	/**
	 * Update password.
	 *
	 * @param loginID the login id
	 * @param newPassword the new password
	 * @return true, if successful
	 */
	public boolean updatePassword(Integer loginID, String newPassword) {
		if (StringUtils.isNotBlank(newPassword)) {
			Login login = loginDAO.findById(loginID);
			login.setPassword(newPassword);
			return loginDAO.saveOrUpdate(login);
		}
		return false;
	}
}
