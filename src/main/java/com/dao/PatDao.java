package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import com.bean.DoctBean;
import com.bean.PatBean;
import com.utility.connection;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PatDao {
	static Connection conn;

	public int register(PatBean pb) {
		int x = 0;
		PreparedStatement ps = null;
		conn = connection.connectDB();
		String sql = "insert into patient(P_FName,P_LName,P_Email,P_Age,P_gender,P_password) values(?,?,?,?,?,?)";
		try {
			String hashPassword = connection.encryptPassword(pb.getP_Password());
			ps = conn.prepareStatement(sql);
			ps.setString(1, pb.getP_FName());
			ps.setString(2, pb.getP_LName());
			ps.setString(3, pb.getP_Email());
			ps.setInt(4, pb.getP_Age());
			ps.setString(5, pb.getP_Gender());
			ps.setString(6, hashPassword);
			x = ps.executeUpdate();
			conn.close();
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

	public ArrayList<DoctBean> getDoctorList() {
		conn = connection.connectDB();
		Statement ps = null;
		String sql = "SELECT concat(d_fname,' ',d_lname) as name,d_gender,d_qualification,d_age,d_email from doctor";
		ArrayList<DoctBean> list = new ArrayList<>();
		try {
			ps = conn.createStatement();
			ResultSet rs = ps.executeQuery(sql);
			while (rs.next()) {
				DoctBean db = new DoctBean();
				db.setD_FName(rs.getString("name"));
				db.setD_Gender(rs.getString("d_gender"));
				db.setD_Qualification(rs.getString("d_qualification"));
				db.setD_Age(rs.getInt("d_age"));
				db.setD_Email(rs.getString("d_email"));
				list.add(db);
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
		return list;
	}

	public String getName(String email) {
		conn = connection.connectDB();
		StringBuilder ans = new StringBuilder();
		Statement stmt = null;
		String sql = "select CONCAT(P_FName,' ', P_LName) AS Name from patient where p_email = '" + email + "'";
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

	public ArrayList<ArrayList<String>> getAppointment(String email) {
		ArrayList<ArrayList<String>> result = new ArrayList<>();
		Statement st = null;
		try {
			String sql = "select a.Status,a.Time,a.Illness,a.Date,a.App_Date,a.App_Time,concat(d.D_FName,' ',d.D_LName) as Name"
					+ " from appointment as a join" + " doctor as d on d.d_email = a.Doct_Email "
					+ " where a.Pat_Email='" + email + "'";

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

	public PatBean getInformation(String email) {
		PatBean ans = new PatBean();
		Statement st = null;
		try {
			String sql = "select concat(P_FName,' ',P_LName) as Name,P_Email,P_Gender,P_Age from patient where p_email = '"
					+ email + "'";
			conn = connection.connectDB();
			st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				ans.setP_FName(rs.getString(1));
				ans.setP_Email(rs.getString(2));
				ans.setP_Gender(rs.getString(3));
				ans.setP_Age(rs.getInt(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
				st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return ans;
	}
}
