package hibernateConfig;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

// Hibernate configuration class
public class HibernateConfiguration {
	
	// To instantiate hibernate the object of SessionFactory instance wil be set to null initially
	private static SessionFactory sessionFactory = null;
	
	// Create a static function in public scope to use the hibernate configuration throughout the project 
	public static SessionFactory getSessionFactory() {
		
		// Object of Configuration class to configure hibernate mappings
		Configuration configuration = new Configuration();
		
		// initiate the sessionFactory object with hibernate.cfg.xml file to configure() method, and buildSessionFactory() 
		sessionFactory = configuration.configure("hibernate.cfg.xml").buildSessionFactory();
		
		// return the object 
		return sessionFactory;
	}
	
}
