package org.reservation;

public class ReservationDto {
	public int no;
	public String name;
	public String jumin;
	public String tel;
	public String symptoms;
	public String date;
	public String time;
	public String location;

	public ReservationDto() {
		this(0, "", "", "", "", "", "","");
	}

	public ReservationDto(int no) {
		this(no, "", "", "", "", "", "","");
	}

	public ReservationDto(int no, String name, String jumin, String tel, String symptoms, String date, String time, String location) {
		this.no = no;
		this.name = name;
		this.jumin = jumin;
		this.tel = tel;
		this.symptoms = symptoms;
		this.date = date;
		this.time = time;
		this.location=location;
	}

	public ReservationDto(String name, String jumin, String tel, String symptoms, String date, String time, String location) {
		this.name = name;
		this.jumin = jumin;
		this.tel = tel;
		this.symptoms = symptoms;
		this.date = date;
		this.time = time;
		this.location = location;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJumin() {
		return jumin;
	}

	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSymptoms() {
		return symptoms;
	}

	public void setSymptoms(String symptoms) {
		this.symptoms = symptoms;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}
	
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "ReservationDto [no=" + no + ", name=" + name + ", jumin=" + jumin + ", tel=" + tel + ", symptoms="
				+ symptoms + ", date=" + date + ", time=" + time + ", location=" + location + "]";
	}

}
