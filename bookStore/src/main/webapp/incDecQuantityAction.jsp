<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>
<%
String email = session.getAttribute("email").toString();
String id = request.getParameter("id");
String incDec = request.getParameter("quantity");
int price = 0;
int total = 0;
int quantity = 0;
int finalTotal = 0;

try {
	Connection con = ConnectionHandler.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from cart where email='"+email+"' and product_id='"+id+"' and address is NULL ");
	while(rs.next()){
		price =rs.getInt(4);
		total = rs.getInt(5);
		quantity = rs.getInt(2);
	}
	if(quantity == 1 && incDec.equals("dec")){
		response.sendRedirect("myCart.jsp?msg=notPossible");
	}
	else if(quantity != 1 && incDec.equals("dec")){
		total -= price;
		quantity --;
		st.executeUpdate("update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("myCart.jsp?msg=dec");
	}else {
		total += price;
		quantity ++;
		st.executeUpdate("update cart set total='"+total+"', quantity='"+quantity+"' where email='"+email+"' and product_id='"+id+"' and address is NULL");
		response.sendRedirect("myCart.jsp?msg=inc");
	}
}catch(Exception e){
	System.out.println(e);
}

%>