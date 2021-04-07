package org.covid19.db;

public class CovidVo {
	String date;
	String checkup;
	String sido;
	String sigungu;
	String name;
	String juso;
	String weekday;
	String saturday;
	String holiday;
	String number;
	
	public CovidVo() {
		
	}
	
	public CovidVo(String date, String checkup, String sido, String sigungu, String name, String juso, String weekday,
			String saturday, String holiday, String number) {
		this.date = date;
		this.checkup = checkup;
		this.sido = sido;
		this.sigungu = sigungu;
		this.name = name;
		this.juso = juso;
		this.weekday = weekday;
		this.saturday = saturday;
		this.holiday = holiday;
		this.number = number;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCheckup() {
		return checkup;
	}
	public void setCheckup(String checkup) {
		this.checkup = checkup;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getJuso() {
		return juso;
	}
	public void setJuso(String juso) {
		this.juso = juso;
	}
	public String getWeekday() {
		return weekday;
	}
	public void setWeekday(String weekday) {
		this.weekday = weekday;
	}
	public String getSaturday() {
		return saturday;
	}
	public void setSaturday(String saturday) {
		this.saturday = saturday;
	}
	public String getHoliday() {
		return holiday;
	}
	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	@Override
	public String toString() {
		return "CovidVo [date=" + date + ", checkup=" + checkup + ", sido=" + sido + ", sigungu=" + sigungu + ", name="
				+ name + ", juso=" + juso + ", weekday=" + weekday + ", saturday=" + saturday + ", holiday=" + holiday
				+ ", number=" + number + "]";
	}
	
	
}
