package org.covid19.naver;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;


public class NaverNewsApi {
	
	private static String clientId = "rG4dfhFdejZYyt4kJFpK"; // 애플리케이션 클라이언트 아이디 값
	private static String clientSecret = "mhqYIl964l"; // 애플리케이션 클라이언트 시크릿 값
	private static String protocol = "GET";
	private static BufferedReader br;
	private static HttpURLConnection conn;
	
	
	public static JSONObject naver_news() throws Exception {
		
			    String text = URLEncoder.encode("코로나19", "UTF-8"); // 검색어
			    String apiURL = "https://openapi.naver.com/v1/search/news.json?query="+ text + "&display=10&start=1&sort=sim"; // 뉴스의 json 결과
	            URL url = new URL(apiURL);
	            conn = (HttpURLConnection)url.openConnection();
	            conn.setRequestMethod(protocol);
	            conn.setRequestProperty("X-Naver-Client-Id", clientId);
	            conn.setRequestProperty("X-Naver-Client-Secret", clientSecret);

	            br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	            
	            StringBuilder sb = new StringBuilder();
	            String inputLine;
	     
	            while ((inputLine = br.readLine()) != null) {
	            	inputLine = inputLine.replaceAll("<b>", "");
	            	sb.append(inputLine);  
	            	// System.out.println(inputLine);
	            }
	            
	            JSONObject naverNews = new JSONObject(sb.toString());  
	            System.out.println(naverNews);
	            return naverNews;
	            
}
	
	
	public static void main(String[] args) throws Exception {
		  
		  naver_news();

	      
  }
}
