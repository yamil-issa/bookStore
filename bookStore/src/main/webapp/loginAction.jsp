<%@page import="bookStore.ConnectionHandler"%>
<%@page import="java.sql.*"%>

<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if("admin@gmail.com".equals(email) && "admin".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin/adminHome.jsp");
}else {
	int a = 0;
	try{
		Connection con = ConnectionHandler.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
		
		while(rs.next()){
			a = 1;
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
			
		}
		if(a == 0){
			response.sendRedirect("login.jsp?msg=notexist");
		}
		
	}catch(Exception e){
		System.out.println(e);
		response.sendRedirect("login.jsp?msg=invalid");
		
	}
}
%>