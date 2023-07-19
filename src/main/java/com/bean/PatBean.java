package com.bean;

public class PatBean {
	private int P_id;
	private String P_FName;
	private String P_LName;
	private String P_Email;
	private int P_Age;
	private String P_Gender;
	private String P_Password;

	public PatBean() {
	}

	public PatBean(int p_id, String p_FName, String p_LName, String p_Email, int p_Age, String p_Gender,
			String p_Password) {
		P_id = p_id;
		P_FName = p_FName;
		P_LName = p_LName;
		P_Email = p_Email;
		P_Age = p_Age;
		P_Gender = p_Gender;
		P_Password = p_Password;
	}

	public int getP_id() {
		return P_id;
	}

	public void setP_id(int p_id) {
		P_id = p_id;
	}

	public String getP_FName() {
		return P_FName;
	}

	public void setP_FName(String p_FName) {
		P_FName = p_FName;
	}

	public String getP_LName() {
		return P_LName;
	}

	public void setP_LName(String p_LName) {
		P_LName = p_LName;
	}

	public String getP_Email() {
		return P_Email;
	}

	public void setP_Email(String p_Email) {
		P_Email = p_Email;
	}

	public int getP_Age() {
		return P_Age;
	}

	public void setP_Age(int p_Age) {
		P_Age = p_Age;
	}

	public String getP_Gender() {
		return P_Gender;
	}

	public void setP_Gender(String p_Gender) {
		P_Gender = p_Gender;
	}

	public String getP_Password() {
		return P_Password;
	}

	public void setP_Password(String p_Password) {
		P_Password = p_Password;
	}

}
