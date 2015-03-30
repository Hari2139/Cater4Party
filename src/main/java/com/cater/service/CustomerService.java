package com.cater.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.constants.Roles;
import com.cater.dao.CustomerDAO;
import com.cater.dao.EventDAO;
import com.cater.dao.MenuDAO;
import com.cater.email.EmailHelper;
import com.cater.model.Customer;
import com.cater.model.Event;
import com.cater.model.Menu;
import com.cater.model.Quote;
import com.cater.twilio.sms.SMSHelper;

@Component
public class CustomerService {
	@Autowired
	private CustomerDAO customerDAO;
	@Autowired
	private EventDAO eventDAO;
	@Autowired
	private MenuDAO menuDAO;
	@Autowired
	private EmailHelper emailHelper;
	@Autowired
	private SMSHelper smsHelper;

	public List <Customer> fetchAllCustomers() {
		return customerDAO.fetchAllCustomers();
	}

	public Customer findCustomerWithLoginId(Integer loginID) {
		return customerDAO.findByLoginID(loginID);
	}

	public Customer findCustomerWithId(Integer customerID) {
		return customerDAO.findById(customerID);
	}

	public boolean saveOrUpdateEvent(Event e) {
		return eventDAO.saveOrUpdate(e);
	}

	public List <Event> fetchAllEvents() {
		return eventDAO.fetchAllEvents();
	}

	public Event findEventWithId(Integer eventId) {
		return eventDAO.findById(eventId);
	}

	public Menu findMenuWithId(Integer menuId) {
		return menuDAO.findById(menuId);
	}

	public boolean saveOrUpdateMenu(Menu m) {
		return menuDAO.saveOrUpdate(m);
	}

	public List <Menu> findMenusWithEventId(Integer eventId) {
		return menuDAO.findMenusWithEventId(eventId);
	}

	public int getNumberOfCustomers() {
		return customerDAO.getNumberOfCustomers();
	}

	public int getNumberOfEvents() {
		return eventDAO.getNumberOfEvents();
	}

	public void sendNotification(Quote quote) {
		emailHelper.sendNotificationEmailTo(Roles.CUSTOMER, quote);
		smsHelper.sendNotificationSMSto(Roles.CUSTOMER, quote);
	}
}
