<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.dao.DoctDao"%>
<%@ page import="com.bean.AppointmentBean"%>
<%@ page import="java.util.ArrayList"%>
<%
if (session.getAttribute("email") == null) {
	response.sendRedirect("signin.jsp");
}
%>
<%
DoctDao dd = new DoctDao();
ArrayList<AppointmentBean> data = dd.showAppointment((String) session.getAttribute("email"));
request.setAttribute("appointmentList", data);
int size = data.size();
String name = dd.getName((String) session.getAttribute("email"));
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" type="image/x-icon" href="./images/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Doctor Home</title>
<link rel="stylesheet" href="css/style.css" />
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-primary bg-gradient">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img src="images/doctor.png"
				alt="image" style="height: 70px; width: 70px" /></a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-2">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="DoctDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active"
						href="Doct_profile.jsp">Profile</a></li>
				</ul>
				<div class="ms-auto">
					<a class="btn btn-outline-danger" href="logout" style="margin-right:60px; color:white;">Logout</a>
				</div>
			</div>
		</div>
	</nav>
	<h1 id="myheading">
		Hello
		<%=name%> !</h1>
	<div class="table-container">
		<table class="table" id="showTable">
			<thead class="table-primary">
				<tr>
					<th>Patient Name</th>
					<th>Status</th>
					<th>Time</th>
					<th>Date</th>
					<th>Illness</th>
					<th>App_Time</th>
					<th>App_Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody class="table-secondary">
				<%
				if (size > 0) {
					for (AppointmentBean ab : data) {
				%>
				<tr>
					<td><%=ab.getName()%></td>
					<td><%=ab.getStatus()%></td>
					<td><%=ab.getTime()%></td>
					<td><%=ab.getDate()%></td>
					<td><%=ab.getIllness()%></td>
					<td><%=ab.getApp_Time()%></td>
					<td><%=ab.getApp_Date()%></td>
					<td>
						<button class="mybtn btn-danger" id="deny_btn"
							onclick="changeTdContent(this, 'Deny')" data-id="<%=ab.getId()%>">
							Deny</button>
						<button class="mybtn btn-success" id="approve_btn"
							onclick="changeTdContent(this, 'Approve')"
							data-id="<%=ab.getId()%>">Approve</button>
					</td>
				</tr>
				<tr>
					<%
					}
					} else {
					%>
					<td colspan="8" class="table-active">No appiontments are
						pending!</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<div class="footer">Created By Gagan Vishwakarma. All Right
		Reserved!</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(document).on(
				"click",
				"#deny_btn",
				function() {
					let id = $(this).data("id");
					if (confirm("Are you sure you want to delete this data?")) {
						$.ajax({
							url : "deleteAppointment",
							method : "post",
							data : {
								record_id : id
							},
							success : function(data) {
								swal("Congrats", "Appointment has been Denied",
										"success");
							}
						});
					}
				});
		$(document)
				.on(
						"click",
						"#approve_btn",
						function() {
							let id = $(this).data("id");
							if (confirm("Are you sure you want to approve this data?")) {
								$
										.ajax({
											url : "approveAppointment",
											method : "post",
											data : {
												record_id : id
											},
											success : function(data) {
												swal(
														"Congrats",
														"Appointment has been Approved",
														"success");
											}
										});
							}
						});
		function changeTdContent(button, content) {
			const td = button.parentNode;
			td.innerText = content;
		}
	</script>
</body>
</html>
