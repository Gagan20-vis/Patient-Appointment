package com.dao;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.AppointmentBean;
import com.bean.DoctBean;
import com.utility.connection;
import java.util.ArrayList;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DoctDao {

	static Connection conn;

	public int register(DoctBean db) {

		int x = 0;

		conn = connection.connectDB();
		PreparedStatement ps = null;

		String sql = "insert into doctor(D_FName,D_LName,D_Email,D_Age,D_gender,D_Qualification,D_password) values(?,?,?,?,?,?,?)";

		try {

			String hashPassword = connection.encryptPassword(db.getD_password());
			ps = conn.prepareStatement(sql);
			ps.setString(1, db.getD_FName());
			ps.setString(2, db.getD_LName());
			ps.setString(3, db.getD_Email());
			ps.setInt(4, db.getD_Age());
			ps.setString(5, db.getD_Gender());
			ps.setString(6, db.getD_Qualification());
			ps.setString(7, hashPassword);
			x = ps.executeUpdate();
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
		return x;
	}

	public ArrayList<AppointmentBean> showAppointment(String email) {
		conn = connection.connectDB();
		ResultSet result = null;
		Statement stmt = null;
		ArrayList<AppointmentBean> data = new ArrayList<>();
		String sql = "SELECT A.S_no, CONCAT(p.P_FName, ' ', p.P_LName) AS Name, A.Status, A.Illness, A.Time, A.Date , A.App_Time,A.App_Date"
				+ " FROM Patient p" + " JOIN appointment A ON P.P_Email = A.Pat_Email" + " WHERE A.Doct_Email='" + email
				+ "' and status='pending'";

		try {

			stmt = conn.createStatement();
			result = stmt.executeQuery(sql);
			while (result.next()) {
				data.add(new AppointmentBean(result.getInt("S_no"), result.getString("Name"),
						result.getString("Status"), FormatTime(result.getString("Time")), result.getString("Date"),
						result.getString("Illness"), FormatTime(result.getString("App_Time")),
						result.getString("App_Date")));
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			try {

				conn.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return data;
	}

	public String getName(String email) {
		conn = connection.connectDB();
		StringBuilder ans = new StringBuilder();
		Statement stmt = null;
		String sql = "select CONCAT(D_FName, ' ', D_LName) AS Name from doctor where d_email = '" + email + "'";
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next())
				ans.append(rs.getString("Name"));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				stmt.close();

			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return ans.toString();
	}

	private String FormatTime(String timeString) {
		DateFormat inputFormat = new SimpleDateFormat("HH:mm:ss");
		DateFormat outputFormat = new SimpleDateFormat("hh:mm a");
		String convertedTime = "";
		try {
			Date time = inputFormat.parse(timeString);
			convertedTime = outputFormat.format(time);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return convertedTime;
	}

	public DoctBean getInformation(String email) {
		DoctBean ans = new DoctBean();
		Statement st = null;
		try {
			String sql = "select concat(D_FName,' ',D_LName) as Name,D_Email,D_Gender,D_Age,D_Qualification from doctor where d_email = '"
					+ email + "'";
			conn = connection.connectDB();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				ans.setD_FName(rs.getString(1));
				ans.setD_Email(rs.getString(2));
				ans.setD_Gender(rs.getString(3));
				ans.setD_Age(rs.getInt(4));
				ans.setD_Qualification(rs.getString(5));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ans;
	}

	public ArrayList<ArrayList<String>> getAppointment(String email) {
		ArrayList<ArrayList<String>> result = new ArrayList<>();
		Statement st = null;
		try {
			String sql = "select a.Status,a.Time,a.Illness,a.Date,a.App_Date,a.App_Time,concat(d.P_FName,' ',d.P_LName) as Name"
					+ " from appointment as a join" + " patient as d on d.p_email = a.Pat_Email "
					+ " where a.Doct_Email='" + email + "' and a.status<>'pending'";

			Connection conn = connection.connectDB();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {
				ArrayList<String> list = new ArrayList<>();
				list.add(rs.getString("Name"));
				list.add(rs.getString("ILLness"));
				list.add(FormatTime(rs.getString("Time")));
				list.add(rs.getString("Date"));
				list.add(rs.getString("Status"));
				list.add(FormatTime(rs.getString("App_Time")));
				list.add(rs.getString("App_Date"));
				result.add(new ArrayList<>(list));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				st.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return result;
	}
}
