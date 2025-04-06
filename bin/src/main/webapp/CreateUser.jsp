<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Register Here </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
</head>
<body>

	<%@ include file="Navbar.jsp" %>

	<!-- Create form for Registration -->
	<div class="container">
		<div class="row">
			<div class="offset-4 col-4">
				<div class="card bg-dark shadow p-3 mb-5 bg-body rounded text-light">
					<h3 class="card-body text-center text-uppercase border-bottom border-secondary border-1"> Register Here </h3>
					<div class="card-body">
						<form action="create" method="post">
							<label style="font-family: aqua;"> User Name </label>
							<input type="text" name="regUsername" class="form-control mb-3">
							
							<label> Password </label>
							<input type="text" name="regPassword" class="form-control mb-3">
							
							<label> Contact </label>
							<input type="text" name="regContact" class="form-control mb-3">
							
							<label> E-mail </label>
							<input type="text" name="regEmail" class="form-control mb-3">
							
							<input type="submit" class="btn btn-primary form-control">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
</body>
</html>