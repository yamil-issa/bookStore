<%@page import="bookStore.ConnectionHandler"%>
<%@page import="java.sql.*"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");
String address = "";
String city = "";
String country = "";

try {
	Connection con = ConnectionHandler.getCon();
	PreparedStatement ps = con.prepareStatement("insert into users values(?, ?, ?, ?, ?, ?, ?)");
	ps.setString(1, name);
	ps.setString(2, email);	
	ps.setString(3, mobileNumber);	
	ps.setString(4, password);	
	ps.setString(5, address);	
	ps.setString(6, city);	
	ps.setString(7, country);	
	ps.executeUpdate();
	response.sendRedirect("signup.jsp?msg=valid");
}catch(Exception e){
	System.out.println(e);
	response.sendRedirect("signup.jsp?msg=invalid");
	
}
%>