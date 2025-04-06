package entity;

import jakarta.persistence.Column;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

// @Entity annotation is used to treat a class as an entity into the database
@jakarta.persistence.Entity

// We can manually set properties to the Entity class / table using @Table(property="value"...) annotation
@Table(name = "hibernateRegistrations")
public class Entity {
	
	// @Id annotation is used for unique identification
	@Id
	
	@GeneratedValue(strategy = GenerationType.IDENTITY)		// This annotation is used to uniquely verify the Entity
	@Column(name = "user_id")		// Using @column() annotation we can modify properties of columns in the database table 
	private int id;
	
	@Column(name = "user_name")
	private String username;
	
	@Column(name = "user_password")
	private String password;
	
	@Column(name = "user_email")
	private String email;
	
	@Column(name = "user_contact")
	private long contact;
	
	// Default Constructor
	public Entity() {
		super();
	}

	// Parameterized Constructor
	public Entity(int id, String username, String password, String email, long contact) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.email = email;
		this.contact = contact;
	}

	// Getters and setters to work with entities DAO
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getContact() {
		return contact;
	}

	public void setContact(long contact) {
		this.contact = contact;
	}

	// toString for testing purpose
	@Override
	public String toString() {
		return "Entity [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", contact=" + contact + "]";
	}
	
}
