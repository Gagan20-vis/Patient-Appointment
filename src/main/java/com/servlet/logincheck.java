package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.DoctBean;
import com.dao.PatDao;
import com.utility.connection;

@WebServlet("/login")
public class logincheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int field = Integer.parseInt(request.getParameter("fields"));
		ResultSet rs = null;
		RequestDispatcher rd = null;

		if (email == null || email.equals("")) {
			request.setAttribute("status", "InvalidEmail");
			rd = request.getRequestDispatcher("signin.jsp");
			rd.forward(request, response);
		}

		if (password == null || password.equals("")) {
			request.setAttribute("status", "InvalidPassword");
			rd = request.getRequestDispatcher("signin.jsp");
			rd.forward(request, response);
		}
		Connection conn = connection.connectDB();
		String hashpassword = connection.encryptPassword(password);
		PreparedStatement ps = null;
		if (field == 6) {
			try {
				String query = "select * from doctor where d_email=? and d_password=?";
				ps = conn.prepareStatement(query);
				ps.setString(1, email);
				ps.setString(2, hashpassword);
				rs = ps.executeQuery();
				if (rs.next()) {
					session.setAttribute("email", rs.getString("D_Email"));
					rd = request.getRequestDispatcher("DoctDashboard.jsp");

				} else {
					request.setAttribute("status", "failed");
					rd = request.getRequestDispatcher("signin.jsp");
				}
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				if (ps != null)
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		} else {
			try {
				String query = "select * from patient where p_email=? and p_password=?";
				ps = conn.prepareStatement(query);
				ps.setString(1, email);
				ps.setString(2, hashpassword);
				rs = ps.executeQuery();
				if (rs.next()) {
					PatDao pd = new PatDao();
					ArrayList<DoctBean> data = pd.getDoctorList();
					session.setAttribute("list", data);
					session.setAttribute("Username", pd.getName(rs.getString("P_Email")));
					session.setAttribute("email", rs.getString("P_Email"));
					rd = request.getRequestDispatcher("PatDashboard.jsp");
				} else {
					request.setAttribute("status", "failed");
					rd = request.getRequestDispatcher("signin.jsp");
				}
				rd.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				if (ps != null)
					try {
						ps.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}
		}

	}

}
