package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.*;
import com.dao.*;

@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String F_Name = request.getParameter("F_Name");
		String L_Name = request.getParameter("L_Name");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String password = request.getParameter("password");
		int field = Integer.parseInt(request.getParameter("fields"));
		String qualification = request.getParameter("qualification");
		int result = 0;
		if (field == 6) {
			DoctBean db = new DoctBean();
			db.setD_FName(F_Name);
			db.setD_LName(L_Name);
			db.setD_Gender(gender);
			db.setD_Age(age);
			db.setD_Email(email);
			db.setD_password(password);
			db.setD_Qualification(qualification);
			DoctDao dd = new DoctDao();
			result = dd.register(db);
		} else {
			PatBean pb = new PatBean();
			pb.setP_FName(F_Name);
			pb.setP_LName(L_Name);
			pb.setP_Email(email);
			pb.setP_Age(age);
			pb.setP_Gender(gender);
			pb.setP_Password(password);
			PatDao pd = new PatDao();
			result = pd.register(pb);
		}
		RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

		if (result > 0) {
			request.setAttribute("status", "success");
		} else {
			request.setAttribute("status", "failed");
		}
		rd.forward(request, response);
	}

}
