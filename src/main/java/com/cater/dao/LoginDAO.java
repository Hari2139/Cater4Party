package com.cater.dao;

import com.cater.model.Login;

public interface LoginDAO {
	boolean save(Login login);

	Login findById(int id);

	public Login findByCredentials(String username, String password);
}
