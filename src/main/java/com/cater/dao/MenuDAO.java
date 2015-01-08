package com.cater.dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.JoinType;
import org.springframework.stereotype.Component;

import com.cater.model.Menu;

/**
 * The Class MenuDAO.
 */
@Component
public class MenuDAO extends AbstractDAO {
	/** The Constant logger. */
	private static final Logger logger = Logger.getLogger(MenuDAO.class);

	/**
	 * Save or update.
	 *
	 * @param menu the menu
	 * @return true, if successful
	 */
	public boolean saveOrUpdate(Menu menu) {
		if (menu == null) {
			logger.error("Cannot save null value for Menu.");
			return false;
		}
		else {
			Menu existingObject = findById(menu.getId());
			if (existingObject == null) {
				return super.save(Menu.class, menu);
			}
			else {
				return super.update(Menu.class, menu);
			}
		}
	}

	/**
	 * Find by id.
	 *
	 * @param id the id
	 * @return the menu
	 */
	public Menu findById(int id) {
		return super.findById(Menu.class, id);
	}

	/**
	 * Find menus with event id.
	 *
	 * @param eventID the event id
	 * @return the list
	 */
	@SuppressWarnings("unchecked")
	public List<Menu> findMenusWithEventId(int eventID) {
		logger.debug("Finding menus with event ID: " + eventID);
		Session session = null;
		Transaction tx = null;
		try {
			session = getSessionFactory().openSession();
			tx = session.beginTransaction();
			List<Menu> list = (List<Menu>) session
					.createCriteria(Menu.class, "menu")
					.createAlias("menu.event", "event",
							JoinType.LEFT_OUTER_JOIN)
					.add(Restrictions.eq("event.id", new Integer(eventID)))
					.list();
			tx.rollback();
			return list;
		}
		catch (HibernateException he) {
			logger.error(
					"Exception occurred while Finding menus with event ID: "
							+ eventID, he);
			throw he;
		}
		finally {
			if (session != null) {
				session.close();
			}
		}
	}
}