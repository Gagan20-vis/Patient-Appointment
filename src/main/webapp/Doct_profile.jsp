<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.dao.DoctDao"%>
<%@ page import="com.bean.DoctBean"%>
<%@ page import="java.util.ArrayList"%>
<%
if (session.getAttribute("email") == null) {
	response.sendRedirect("signin.jsp");
}
%>
<%
DoctDao dd = new DoctDao();
DoctBean db = dd.getInformation((String) session.getAttribute("email"));
ArrayList<ArrayList<String>> list = dd.getAppointment((String) session.getAttribute("email"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/x-icon" href="./images/favicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/profile.css">
<title>Profile</title>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-primary bg-gradient">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img
				src="images/doctor.png" alt="image"
				style="height: 70px; width: 70px;" /></a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-2">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="DoctDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Appointment</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1 dropdown"><a
						class="nav-link dropdown-toggle " href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" style="color: black;"
						aria-expanded="false">User</a>
						<ul class="dropdown-menu " aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="doctprofile">Profile</a></li>
							<li><a class="dropdown-item" href="logout">Logout</a></li>
						</ul>
				</ul>
			</div>
		</div>
	</nav>
	<div class="student-profile py-4">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="card shadow-sm">
						<div class="card-header bg-transparent border-0">
							<h3 class="mb-0">
								<i class="far fa-clone pr-1"></i>General Information
							</h3>
						</div>
						<div class="card-body pt-0">
							<table class="table table-bordered">
								<tr>
									<th width="30%">Name</th>
									<td width="2%">:</td>
									<td><%=db.getD_FName()%></td>
								</tr>
								<tr>
									<th width="30%">Email</th>
									<td width="2%">:</td>
									<td><%=db.getD_Email()%></td>
								</tr>
								<tr>
									<th width="30%">Gender</th>
									<td width="2%">:</td>
									<td><%=db.getD_Gender()%></td>
								</tr>
								<tr>
									<th width="30%">Age</th>
									<td width="2%">:</td>
									<td><%=db.getD_Age()%></td>
								</tr>
								<tr>
									<th width="30%">Qualification</th>
									<td width="2%">:</td>
									<td><%=db.getD_Qualification()%></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<h3 id="mid_heading">Past Records</h3>
	<div class="table-container">
		<table class="table table-striped">
			<thead class="table-primary">
				<tr>
					<th>Patient Name</th>
					<th>Illness</th>
					<th>Time</th>
					<th>Date</th>
					<th>Status</th>
					<th>App_Time</th>
					<th>App_Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (ArrayList<String> temp : list) {
				%>
				<tr>
					<td><%=temp.get(0)%></td>
					<td><%=temp.get(1)%></td>
					<td><%=temp.get(2)%></td>
					<td><%=temp.get(3)%></td>
					<td><%=temp.get(4)%></td>
					<td><%=temp.get(5)%></td>
					<td><%=temp.get(6)%></td>
				</tr>
				<tr>
					<%
					}
					%>
				
			</tbody>
		</table>
	</div>
	<div class="footer">Created By Gagan Vishwakarma. All Right
		Reserved!</div>
</body>
</body>
</html>