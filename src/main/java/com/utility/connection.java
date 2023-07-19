package com.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.security.MessageDigest;

public class connection {
	static Connection con;

	public static Connection connectDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/patientappointment", "root", "Gagan@20");
			System.out.println("Connection Successfull");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public static String encryptPassword(String number) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA");
			md.update(number.getBytes());
			byte[] resultByteArray = md.digest();
			StringBuilder sb = new StringBuilder();
			for (byte b : resultByteArray)
				sb.append(String.format("%02x", b));
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
