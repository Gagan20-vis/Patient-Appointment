<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha512-rRQtF4V2wtAvXsou4iUAs2kXHi3Lj9NE7xJR77DE7GHsxgY9RTWy93dzMXgDIG8ToiRTD45VsDNdTiUagOFeZA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" type="image/x-icon" href="images/favicon.ico">
<!-- STYLE CSS -->
<link rel="stylesheet" href="css/login.css" />
</head>
<title>Login In</title>
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">
	<%
	String fieldsParam = request.getParameter("fields");
	int numFields = 4; // Default value

	if (fieldsParam != null) {
		numFields = Integer.parseInt(fieldsParam);
	}
	%>
	<div class="wrapper">
		<div class="inner"
			style="box-shadow: 0 20px 64px 0 rgb(0, 0, 0), 0 20px 25px 0 rgb(0 0 0/ 78%);">
			<div class="image-holder">
				<img src="images/login.jpg" alt="" />
			</div>
			<form action="login" method="post">
				<input type="hidden" name="fields" value="<%=numFields%>" />
				<%
				if (numFields == 6) {
				%>
				<h3>Doctor Login</h3>
				<%
				} else {
				%>
				<h3>Patient Login</h3>
				<%
				}
				%>
				<div class="form-wrapper">
					<input type="text" placeholder="Email Address" class="form-control"
						name="email"/> <i class="zmdi zmdi-email"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="Password" class="form-control"
						name="password" /> <i
						class="zmdi zmdi-lock"></i>
				</div>
				<button type="submit">
					Login <i class="zmdi zmdi-arrow-right"></i>
				</button>
				<br>
				<div class="form-wrapper" style="text-align: center;">
					<span class="zmdi">Not Registered ? </span> <a
						href="register.jsp?fields=<%=numFields%>">Register</a>
				</div>

			</form>
		</div>
	</div>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		let msg = document.getElementById("status").value;
		if (msg == 'failed') {
			swal("Sorry", "Invalid Username or Password", "error");
		}
		if (msg == 'InvalidEmail') {
			swal("Sorry", "Please Enter Email", "error");
		}
		if (msg == 'InvalidPassword') {
			swal("Sorry", "Please Enter Password", "error");
		}
	</script>
	<div class="footer">Created By Gagan Vishwakarma . All Right
		Reserved!</div>
</body>
</html>