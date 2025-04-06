<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.util.Iterator"%>
<%@page import="entity.Entity"%>
<%@page import="java.util.List"%>
<%@page import="hibernateConfig.HibernateConfiguration"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> Update </title>
<link rel="stylesheet" href="Bootstrap/bootstrap.min.css">
</head>
<body>

	<%@ include file="Navbar.jsp" %>
	
	<!-- Create list to diaplay data of database -->
	
	<div class="container">
		<div class="row">
			<div class="offset-1 col-10">
				<div class="shadow p-3 mb-5 rounded text-light">
					<table class="table table-borderless text-light">
						<thead class="border-bottom border-light">
							<tr>
								<th> Id </th>
								<th> Username </th>
								<th> Password </th>
								<th> contact </th>
								<th> E-mail </th>
								<th colspan="2" class="text-center"> Action </th>
							</tr>
						</thead>
						<tbody>
						<%
							List<Entity> userList = (List) request.getAttribute("userList");
							
							if(request.getAttribute("userList") != null ){
								
								Iterator<Entity> iterator = userList.iterator();
								while(iterator.hasNext()){
									Entity entity = iterator.next();
							
						%>
							<tr>
								<td class="pt-3"> <%= entity.getId() %> </td>
								<td class="pt-3"> <%= entity.getUsername() %> </td>
								<td class="pt-3"> <%= entity.getPassword() %> </td>
								<td class="pt-3"> <%= entity.getContact() %> </td>
								<td class="pt-3"> <%= entity.getEmail() %> </td>
								<td> <a class="btn btn-warning text-light shadow pl-4 pr-4 mb-3 bg-body rounded border-0" href="update?id=<%= entity.getId()%>"> Update </a> </td>
								<td> <a class="btn btn-danger disabled text-light shadow pl-4 pr-4 mb-3 bg-body rounded border-0" href="delete?id=<%= entity.getId()%>"> Delete </a> </td>
							</tr>
						<%
								}
							}
							System.out.println("Records fetch succeed..!");
						%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	

	<script type="text/javascript" src="Bootstrap/jquery.js"></script>
	<script type="text/javascript" src="Bootstrap/bootstrap.min.js"></script>
</body>
</html>