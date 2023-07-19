package com.bean;

public class AppointmentBean {
	private int Id;
	private String Name;
	private String status;
	private String date;
	private String time;
	private String App_Time;
	private String App_Date;
	private String Illness;

	public AppointmentBean() {
	}

	public AppointmentBean(int Id, String name, String status, String time, String date, String Illness,
			String App_Time, String App_Date) {
		Name = name;
		this.status = status;
		this.time = time;
		this.Illness = Illness;
		this.date = date;
		this.App_Date = App_Date;
		this.App_Time = App_Time;
		this.Id = Id;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getIllness() {
		return Illness;
	}

	public void setIllness(String illness) {
		Illness = illness;
	}

	public String getApp_Time() {
		return App_Time;
	}

	public void setApp_Time(String app_Time) {
		App_Time = app_Time;
	}

	public String getApp_Date() {
		return App_Date;
	}

	public void setApp_Date(String app_Date) {
		App_Date = app_Date;
	}
}
