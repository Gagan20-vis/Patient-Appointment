package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.utility.connection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/SaveAppointmentServlet")
public class SaveAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String D_email = request.getParameter("D_email");
		String illness = request.getParameter("Illness");
		String date = request.getParameter("date");
		String time = request.getParameter("time");

		SimpleDateFormat inputFormat = new SimpleDateFormat("hh:mm a");
		String sql = "";

		Connection conn = connection.connectDB();
		Statement ps = null;
		try {
			Date mydate = inputFormat.parse(time);
			Time sqlTime = new Time(mydate.getTime());
			sql = "INSERT INTO appointment (Pat_Email, Doct_Email, Time, Illness, Date, App_Date, App_Time) VALUES ('"
					+ (String) session.getAttribute("email") + "','" + D_email + "', NOW(),'" + illness
					+ "', CURDATE(),'" + date + "','" + sqlTime + "')";
			ps = conn.createStatement();

			int res = ps.executeUpdate(sql);
			if (res > 0) {
				session.setAttribute("AppointmentResult", "success");
			} else {
				session.setAttribute("AppointmentResult", "failed");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				ps.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
	}

}
