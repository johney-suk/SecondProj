package org.covid19.statusBoardApi;


import java.net.HttpURLConnection;
import java.net.URL;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class StatusBoard {
	
	private static String Address;
	private static URL url;
	private static BufferedReader br;
	private static HttpURLConnection conn;
	private static String protocol = "GET";
	
	public static JSONObject status_korea() throws Exception {
		
		Address = "https://api.corona-19.kr/korea/?serviceKey=k83ZeuwG1YiBRI7cMKErsoL2AyjTP49ND";
		
		url = new URL(Address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);

		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		
		StringBuilder sb = new StringBuilder();
		
		String line;
		
		while((line = br.readLine()) != null)  {
			//System.out.println(line);
			sb.append(line);
		}
		
		JSONObject json = new JSONObject(sb.toString());
		
		//System.out.println(json);
		
		return json;
		
	}
	
	public static JSONObject status_city() throws Exception {
		
		Address = "https://api.corona-19.kr/korea/country/new/?serviceKey=k83ZeuwG1YiBRI7cMKErsoL2AyjTP49ND";
		
		url = new URL(Address);
		conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod(protocol);

		br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		
		StringBuilder sb = new StringBuilder();
		
		String line;
		
		while((line = br.readLine()) != null)  {
			//System.out.println(line);
			sb.append(line);
		}
		
		JSONObject json = new JSONObject(sb.toString());
		
		//System.out.println(json);
		
		return json;
		
	}
	
	public static void main(String[] args) throws Exception {
		
		status_korea();
		status_city().get("korea");
		
		//SONObject job = new JSONObject(status_city().get("korea").toString());
		//String recv = (String) job.get("recovered");
		//System.out.println(recv);
	}

}
