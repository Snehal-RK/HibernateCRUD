package requestHandler;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import entity.Entity;
import hibernateConfig.HibernateConfiguration;

public class HibernateDAOHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HibernateDAOHandler() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// If we choose to manually perform operations for particular method; we may use this method
		String method = request.getMethod();
		
		// This will fetch us the requested URI which helps us write conditions by differentiating between mapping URL's
		String req = request.getRequestURI();

		// Array will be required for splitting the request which we have stored in a string format 
		String arr[] = req.split("/");		// hence we can provide a proper index to find proper URL request for mapping
		String servletReq = arr[2];		// we received the exact mapping URL here which will be used throughout the code
		
//-------------------------------------------------------------------------------------------------------------------------
		
		// Transaction interface's object is used to interact with database directly from the java code
		Transaction transaction;
		
		// Session is interface between java code and hibernate
		Session session = HibernateConfiguration.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		
		// Object of our Entity class which is being treated as @Entity for our database
		Entity entity = new Entity();
		
//-------------------------------------------------------------------------------------------------------------------------
		
		if(servletReq.equals("index")) {
			response.sendRedirect("index.jsp");
		}
		else if(servletReq.equals("create")) {
			response.sendRedirect("CreateUser.jsp");
		}
		else if(servletReq.equals("read")) {
			
			// To read data we need an object of list to fetch the records and use alternatively
			// instantiate it with session.createQuery("from @EntityClass").list() => to convert this object into list
			List<Entity> userList = session.createQuery("from Entity").list();
			request.setAttribute("userList", userList);		// setAttribute method to send data through the object
			
			// RequestDispatcher to directly send data to the desired page
			javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("ReadUser.jsp");
			
			// Forward the the response  
			dispatcher.forward(request, response);
			transaction.commit();	// commit the transaction
			session.close();	// close the session
		}
		else if(servletReq.equals("updationList")) {
			
			// To read data we need an object of list to fetch the records and use alternatively
			// instantiate it with session.createQuery("from @EntityClass").list() => to convert this object into list
			List<Entity> userList = session.createQuery("from Entity").list();
			request.setAttribute("userList", userList);		// setAttribute method to send data through the object
			
			// RequestDispatcher to directly send data to the desired page
			javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("ListForUpdate.jsp");
			
			// Forward the the response  
			dispatcher.forward(request, response);
			transaction.commit();	// commit the transaction
			session.close();	// close the session
		}
		else if(servletReq.equals("deletionList")) {
			
			// To read data we need an object of list to fetch the records and use alternatively
			// instantiate it with session.createQuery("from @EntityClass").list() => to convert this object into list
			List<Entity> userList = session.createQuery("from Entity").list();
			request.setAttribute("userList", userList);		// setAttribute method to send data through the object
			
			// RequestDispatcher to directly send data to the desired page
			javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("ListForDelete.jsp");
			
			// Forward the the response  
			dispatcher.forward(request, response);
			transaction.commit();	// commit the transaction
			session.close();	// close the session
		}
		else if(servletReq.equals("update")) {
			// when update request encounters we must fetch the existing records by providing primary key for particular entity
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("Retrieving details from id : "+id);
			
			// Instantiate get() method to the Entity object by passing the Entity class and primary key
			entity = session.get(Entity.class, id);
			System.out.println(entity.toString());
			
			// pass the object to the setAttribute method to fetch data into updation form 
			request.setAttribute("select", entity);
			
			// Through the object of request dispatcher initiate data for the desired page / updation form page
			javax.servlet.RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateUser.jsp");
			dispatcher.forward(request, response);		// forward the data
			transaction.commit();		// commit the transaction
			session.close();		// close the session
		}
		else if(servletReq.equals("delete")) {
			// when delete request encounters we must pass the the primary key as parameter 
			int id = Integer.parseInt(request.getParameter("id"));
			
			entity = session.get(Entity.class, id);
			session.delete(entity);
			transaction.commit();
			session.close();
			response.sendRedirect("read");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getMethod();
		String req = request.getRequestURI();
		String arr[] = req.split("/");
		String servletReq = arr[2];
		
//-------------------------------------------------------------------------------------------------------------------------
		
		Transaction transaction;
		Session session = HibernateConfiguration.getSessionFactory().openSession();
		transaction = session.beginTransaction();
		Entity entity = new Entity();
		
//-------------------------------------------------------------------------------------------------------------------------
		
		if(servletReq.equals("create")) {
			// To perform Create query / operation
			// Fetch parameters from our registration form using HttpRequest 
			String regUsername = request.getParameter("regUsername");
			String regPassword = request.getParameter("regPassword");
			String regContact = request.getParameter("regContact");
			String regEmail = request.getParameter("regEmail");
			
			// set fetched parameters to the setters to set into the database
			entity.setUsername(regUsername);
			entity.setPassword(regPassword);
			entity.setContact(Long.parseLong(regContact));
			entity.setEmail(regEmail);
			
			// pass the Entity object to the save() method using instance of our session interface
			session.save(entity);
			
			// commit the transaction to execute the operation
			transaction.commit();
			session.close();	// close the session torelease the jdbc connection
			System.out.println("Record saved successfully..!");		// An acknowledgement of completion 
			response.sendRedirect("Success.jsp");
		}
		else if(servletReq.equals("update")) {
			// To update the existing details / records 
			// We need to fetch the id / primary key of an existing row
			// which would be received from the updation form using hidden input type
			int id = Integer.parseInt(request.getParameter("hid"));
			
			// Receive the records in the form of object using session.get() method 
			// by passwing the Entity class and pass the id variable
			// and store the results in the object our @Entity class
			entity = session.get(Entity.class, id);
			
			// use setters to set the latest provided values
			// Which will be fetched from the Updation.form using HttpRequest
			entity.setUsername(request.getParameter("updateUsername"));
			entity.setPassword(request.getParameter("updatePassword"));
			entity.setContact(Long.parseLong(request.getParameter("updateContact")));
			entity.setEmail(request.getParameter("updateEmail"));
			
			// pass the object as a parameter to the save() method 
			session.save(entity);
			transaction.commit();	// commit the transaction
			session.close();	// close the session
			System.out.println("Details updated successfully..!");		// An acknowledgement
			response.sendRedirect("read");
		}
		
	}

}
