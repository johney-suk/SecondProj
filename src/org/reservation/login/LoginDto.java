package org.reservation.login;

public class LoginDto {
	private String ID;
	private String PW;

	public LoginDto() {
		this("", "");
	}

	public LoginDto(String ID, String PW) {
		this.ID = ID;
		this.PW = PW;
	}

	public String getID() {
		return ID;
	}

	public void setID(String iD) {
		ID = iD;
	}

	public String getPW() {
		return PW;
	}

	public void setPW(String pW) {
		PW = pW;
	}

}
