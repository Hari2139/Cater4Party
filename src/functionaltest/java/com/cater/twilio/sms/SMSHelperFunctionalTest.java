package com.cater.twilio.sms;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cater.constants.QuoteStatus;

/**
 * Description: 
 * Created: Mar 27, 2015
 * @author Hari 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:test-applicationContext-hibernate.xml" })
@Component
public class SMSHelperFunctionalTest {
	@Autowired
	private SMSHelper fixture;

	@Test
	public void testSendStatusNotification() {
		fixture.sendStatusNotification("9165204113", QuoteStatus.CREATED);
	}
}