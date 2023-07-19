<%@page import="javax.swing.text.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.PatDao"%>
<%@ page import="com.bean.DoctBean"%>
<%@ page import="java.util.ArrayList"%>
<%
if (session.getAttribute("email") == null) {
	response.sendRedirect("signin.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/x-icon" href="./images/favicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<title>Patient Home</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-light bg-primary bg-gradient">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"><img src="images/doctor.png"
				alt="image" style="height: 70px; width: 70px;" /></a>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-2">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="PatDashboard.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active" href="#">Appointment</a>
					</li>
					<li class="nav-item mx-0 mx-lg-1 dropdown"><a
						class="nav-link dropdown-toggle " href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" style="color: black;"
						aria-expanded="false"><%=session.getAttribute("Username")%></a>
						<ul class="dropdown-menu " aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="Pat_profile.jsp">Profile</a></li>
							<li><a class="dropdown-item" href="logout">Logout</a></li>
						</ul>
				</ul>
			</div>
		</div>
	</nav>
	<h1>Hello <%=session.getAttribute("Username")%></h1>
	<div class="table-container">
		<table class="table">
			<thead class="table-primary">
				<tr>
					<th>Doctor Name</th>
					<th>Gender</th>
					<th>Qualification</th>
					<th>Age</th>
					<th>Appointment</th>
				</tr>
			</thead>
			<tbody class="table-secondary">
				<%
				ArrayList<DoctBean> list = (ArrayList<DoctBean>) session.getAttribute("list");
				for (DoctBean db : list) {
				%>
				<tr>
					<td><%=db.getD_FName()%></td>
					<td><%=db.getD_Gender()%></td>
					<td><%=db.getD_Qualification()%></td>
					<td><%=db.getD_Age()%></td>
					<td><button class="mybtn btn-success book-appointment-btn"
							data-bs-toggle="modal" data-bs-target="#add_data_Modal"
							data-email="<%=db.getD_Email()%>"
							data-name="<%=db.getD_FName()%>">Book Appointment</button></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="add_data_Modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Appointment</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<div class="modal-body">
					<div class="mb-3">
						<form method="post" id="insert_form">
							<label>Patient Name : </label> <input name="P_email" id="P_email"
								type="text" value="<%=session.getAttribute("Username")%>"
								class="form-control" readonly> <br> <label>Doctor
								Name :</label> <input name="D_email" id="D_email" type="text"
								class="form-control" readonly> <br> <label>Illness
								:</label> <input name="Illness" id="Illness" type="text"
								placeholder="Enter problem" class="form-control"> <br>
							<div class="row">
								<div class="col-md-6">
									<input type="text" id="date" name="date" class="form-control"
										value="null" placeholder="Date" data-toggle="datetimepicker"
										data-target="#datetimePicker" autocomplete="off">
								</div>
								<div class="col-md-6">
									<input type="text" name="time" id="time" class="form-control"
										value="null" placeholder="Time" data-toggle="timepicker"
										data-target="#timepicker" autocomplete="off">
								</div>
							</div>
							<input type="submit" name="insert" id="insert"
								value="Send Appointment" class="btn btn-outline-info"
								style="border-radius: 50px;" />
						</form>
					</div>
				</div>
				<div class="modal-footer">
					<div class="d-grid gap-2 col-6 mx-auto">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">Created By Gagan Vishwakarma . All Right
		Reserved!</div>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			let doct_email;
			$('.book-appointment-btn').click(function() {
				var firstName = $(this).data('name');
				doct_email = $(this).data('email');
				$('#D_email').val(firstName);
			});
			$('#date').val('');
			$('#time').val('');
			$("#date").datepicker({
				dateFormat : 'yy-mm-dd',
				dayNamesMin : [ "Su", "Mo", "Tu", "We", "Th", "Fr", "Sa" ]
			});
			$('#time').timepicker({
				timeFormat : 'h:mm p',
				interval : 60,
				minTime : '10',
				maxTime : '6:00pm',
				startTime : '10:00',
				dynamic : true,
				dropdown : true,
				scrollbar : true
			});
			$('#insert_form').on("submit", function(event) {
				event.preventDefault();
				if ($('#Illness').val() == '')
					alert("Illness is required");
				else if ($('#date').val() == '')
					alert("Appointment date is required");
				else if ($('#time').val() == '')
					alert("Time is required");
				else {
					$('#D_email').val(doct_email);
					$.ajax({
						url : "SaveAppointmentServlet",
						method : "POST",
						data : $('#insert_form').serialize(),
						beforeSend : function() {
							$('#insert').val("Inserting");
						},
						success : function(data) {
							$('#insert_form')[0].reset();
							$('#add_data_Modal').modal('hide');
							swal("Congrats", "Appointment Sent", "success");
						}
					});
				}
			});
		});
	</script>
</body>
</html>