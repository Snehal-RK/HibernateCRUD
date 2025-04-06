<%@page import="java.util.Iterator"%>
<%@page import="entity.Entity"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Update </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">

<style>
	.input-control input:focus {
		outline: none ;
		border: none ;
		box-shadow: none;
	}
	
	.input-control.success input {
 		background-color: #D0F0C0;
		border-color: #09c372; 
	}
	
	.input-control.error input {
		background-color: #ffdadb;
		border-color: #ff3860;
	}
	
	.input-control .error {
		color: #ff3860;
		font-size: 10px;
		height: 13px;
		margin-top: -15px;
		margin-bottom: 10px;
	}
</style>

</head>
<body>

	<%@ include file="Navbar.jsp" %>

	<!-- Create form for Updation -->
	<div class="container">
		<div class="row">
			<div class="offset-4 col-4">
				<div class="card bg-dark shadow p-3 mb-5 bg-body rounded text-light">
					<h3 class="card-body text-center text-uppercase border-bottom border-secondary border-1"> Register Here </h3>
					<div class="card-body">
					
					<%
						Entity userDetails = (Entity) request.getAttribute("select");
						if(request.getAttribute("select") != null){
					%>
					
						<form action="update" method="post" id="form">
						
							<div class="input-control">
								<label> User Name </label>
								<input type="text" id="updateUsername" name="updateUsername" class="form-control mb-3" value="<%= userDetails.getUsername() %>">
								<div class="error"></div>
							</div>
							
							<div class="input-control">
								<label> Password </label>
								<input type="text" id="updatePassword" name="updatePassword" class="form-control mb-3" value="<%= userDetails.getPassword() %>">
								<div class="error"></div>
							</div>
							
							<div class="input-control">
								<label> Contact </label>
								<input type="text" id="updateContact" name="updateContact" class="form-control mb-3" value="<%= userDetails.getContact() %>">
								<div class="error"></div>
							</div>
							
							<div class="input-control">
								<label> E-mail </label>
								<input type="text" id="updateEmail" name="updateEmail" class="form-control mb-3" value="<%= userDetails.getEmail() %>">
								<div class="error"></div>
							</div>
						
							<div class="input-control">
								<input type="submit" class="btn btn-primary form-control" value="Update">
								<input type="hidden" name="hid" value="<%= userDetails.getId() %>">
							</div>
							
						</form>
						
					<%
						}
					%>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
	<script>
		const form = document.getElementById('form');
		const username = document.getElementById('updateUsername');
		const password = document.getElementById('updatePassword');
		const contact = document.getElementById('updateContact');
		const email = document.getElementById('updateEmail');
		
		form.addEventListener('submit', e => {
			e.preventDefault();
			
			console.log("Submit button clicked.");
			
			let isValid = validateInputs();
			console.log("After validateInputs, isValid : ", isValid);
			
			const errorElements = form.querySelectorAll('.error');
			console.log("Number of error elements : ", errorElements.length);
			
			if(!isValid) {
				console.log("Validation failed. Form not submitted.");
			}
			else {
				console.log("Validate passed. Submitting form.");
				form.submit();
			}
			
		});
		
		const setError = (element, message) => {
			const inputControl = element.parentElement;
			const errorDisplay = inputControl.querySelector('.error');
			
			errorDisplay.innerText = message;
			inputControl.classList.add('error');
			inputControl.classList.remove('success');
		}
		
		const setSuccess = element => {
			const inputControl = element.parentElement;
			const errorDisplay = inputControl.querySelector('.error');
			
			errorDisplay.innerText = '';
			inputControl.classList.add('success');
			inputControl.classList.remove('error');
		};
		
		const isValidContact = contact => {
			const re = /^\d{10}$/;
			return re.test(contact);
		}
		
		const isValidEmail = email => {
			const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"])*)|(".+"))@((\[[0-9]{1,3}\.[0,9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			return re.test(String(email).toLowerCase());
		}
		
		const validateInputs = () => {
			isValidLocal = true;
			const usernameVal = username.value.trim();
			const passwordVal = password.value.trim();
			const contactVal = contact.value.trim();
			const emailVal = email.value.trim();
			
			// Username
			if(usernameVal === '') {
				setError(username,'Username cannot be empty.');
				isValidLocal = false;
			}
			else{
				setSuccess(username);
			}
			
			// Password
			if(passwordVal === '') {
				setError(password, 'Password cannot be empty.');
				isValidLocal = false;
			}
			else if(passwordVal.length < 8){
				setError(password, 'Password must be at least 8 characters');
				isValidLocal = false;
			}
			else{
				setSuccess(password);
			}
			
			// Contact
			if(contactVal === '') {
				setError(contact, 'Contact cannot be empty.');
				isValidLocal = false;
			}
			else if(!isValidContact(contactVal)) {
				setError(contact, "Contact must be a 10-digit number");
				isValidLocal = false;
			}
			else {
				setSuccess(contact);
			}
			
			// Email
			if(emailVal === '') {
				setError(email, 'Email cannot be empty.');
				isValidLocal = false;
			}
			else if(!isValidEmail(emailVal)){
				setError(email, 'Invalid email format');
				isValidLocal = false;
			}
			else {
				setSuccess(email);
			}
			
			return isValidLocal ;
		}
	</script>
</body>
</html>