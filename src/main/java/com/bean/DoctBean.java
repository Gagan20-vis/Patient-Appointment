package com.bean;

public class DoctBean {
	private int D_id;
	private String D_FName;
	private String D_LName;
	private String D_Email;
	private String D_Gender;
	private int D_Age;
	private String D_Qualification;
	private String D_password;

	public DoctBean() {
	}

	public DoctBean(int d_id, String d_FName, String d_LName, String d_Email, String d_Gender, int d_Age,
			String d_Qualification, String d_password) {
		D_id = d_id;
		D_FName = d_FName;
		D_LName = d_LName;
		D_Email = d_Email;
		D_Gender = d_Gender;
		D_Age = d_Age;
		D_Qualification = d_Qualification;
		D_password = d_password;
	}

	public int getD_id() {
		return D_id;
	}

	public void setD_id(int d_id) {
		D_id = d_id;
	}

	public String getD_FName() {
		return D_FName;
	}

	public void setD_FName(String d_FName) {
		D_FName = d_FName;
	}

	public String getD_LName() {
		return D_LName;
	}

	public void setD_LName(String d_LName) {
		D_LName = d_LName;
	}

	public String getD_Email() {
		return D_Email;
	}

	public void setD_Email(String d_Email) {
		D_Email = d_Email;
	}

	public String getD_Gender() {
		return D_Gender;
	}

	public void setD_Gender(String d_Gender) {
		D_Gender = d_Gender;
	}

	public int getD_Age() {
		return D_Age;
	}

	public void setD_Age(int d_Age) {
		D_Age = d_Age;
	}

	public String getD_Qualification() {
		return D_Qualification;
	}

	public void setD_Qualification(String d_Qualification) {
		D_Qualification = d_Qualification;
	}

	public String getD_password() {
		return D_password;
	}

	public void setD_password(String d_password) {
		D_password = d_password;
	}

}
