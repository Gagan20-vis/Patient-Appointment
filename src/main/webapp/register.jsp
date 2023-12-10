<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Registration</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" type="image/x-icon" href="/images/favicon.ico" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha512-rRQtF4V2wtAvXsou4iUAs2kXHi3Lj9NE7xJR77DE7GHsxgY9RTWy93dzMXgDIG8ToiRTD45VsDNdTiUagOFeZA==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<!-- STYLE CSS -->
<link rel="stylesheet" href="./css/login.css" />
</head>

<body>
	<%
	String fieldsParam = request.getParameter("fields");
	int numFields = 4;
	if (fieldsParam != null) {
		numFields = Integer.parseInt(fieldsParam);
	}
	%>
	<div class="wrapper">
		<div class="inner"
			style="box-shadow: 0 20px 64px 0 rgb(0, 0, 0), 0 20px 25px 0 rgb(0 0 0/ 78%);">
			<div class="image-holder">
				<img src="images/doct2.jpg" alt="" />
			</div>
			<form action="registration" method="post">
				<div>
					<input type="hidden" name="fields" value="<%=numFields%>" />
				</div>
				<%
				if (numFields == 6) {
				%>
				<h3>Doctor Registration</h3>
				<%
				} else {
				%>
				<h3>Patient Registration</h3>
				<%
				}
				%>
				<div class="form-group">
					<input type="text" name="F_Name" placeholder="First Name"
						class="form-control" required /> <input type="text"
						name="L_Name" placeholder="Last Name" class="form-control"
						required />
				</div>
				<div class="form-wrapper">
					<input type="text" name="age" placeholder="Age"
						class="form-control" required /> <i
						class="zmdi zmdi-account"></i>
				</div>
				<div class="form-wrapper">
					<input type="text" placeholder="Email Address" name="email"
						class="form-control" required /> <i
						class="zmdi zmdi-email"></i>
				</div>
				<div class="form-wrapper">
					<select name="gender" id="" class="form-control" required>
						<option value="" disabled selected>Gender</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
					</select> <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
				</div>
				<%
				if (numFields == 6) {
				%>
				<div class="form-wrapper">
					<select name="qualification" id="" class="form-control" required>
						<option value="" disabled selected>Qualification</option>
						<option value="Bachelor of Medicine, Bachelor of Surgery">
							MBBS (Bachelor of Medicine, Bachelor of Surgery)</option>
						<option value="Doctor of Medicine">MD (Doctor of
							Medicine)</option>
						<option value="Doctor of Philosophy">PhD (Doctor of
							Philosophy)</option>
						<option value="Master of Surgery">MS (Master of Surgery)</option>
						<option value="Master of Chirurgiae">MCh (Master of
							Chirurgiae)</option>
						<option value="Diplomate of National Board">DNB
							(Diplomate of National Board)</option>
						<option value="Doctor of Osteopathic Medicine">DO (Doctor
							of Osteopathic Medicine)</option>
						<option value="Doctor of Dental Medicine">DMD (Doctor of
							Dental Medicine)</option>
						<option value="Bachelor of Dental Surgery">BDS (Bachelor
							of Dental Surgery)</option>
						<option value="Doctor of Physical Therapy">DPT (Doctor of
							Physical Therapy)</option>
						<option value="Doctor of Pharmacy">PharmD (Doctor of
							Pharmacy)</option>
						<option value="Doctor of Veterinary Medicine">DVM (Doctor
							of Veterinary Medicine)</option>
						<option value="Doctor of Optometry">OD (Doctor of
							Optometry)</option>
						<option value="Doctor of Chiropractic">DC (Doctor of
							Chiropractic)</option>
						<option value="Doctor of Psychology">PsyD (Doctor of
							Psychology)</option>
					</select> <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
				</div>
				<%
				}
				%>
				<div class="form-wrapper">
					<input name="password" type="password" placeholder="Password"
						class="form-control" required /> <i
						class="zmdi zmdi-lock"></i>
				</div>

				<button type="submit">
					Register <i class="zmdi zmdi-arrow-right"></i>
				</button>
				<div class="form-wrapper" style="text-align: center">
					<span class="zmdi">Already have account ? </span> <a
						href="signin.jsp?fields=<%=numFields%>">Login</a>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">Created By Gagan Vishwakarma . All Right
		Reserved!</div>
</body>
</html>
