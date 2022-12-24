<%@page import="bookStore.ConnectionHandler"%>
<%@page import="java.sql.*"%>

<% 
try{
	Connection con = ConnectionHandler.getCon();
	Statement st = con.createStatement();
	String r1 ="create table users(name varchar(100), email varchar(100)primary key, mobileNumber bigint, password varchar(100), address varchar(500), city varchar(100), country varchar(100))";
	String r2 = "create table books(id int, name varchar(500), category varchar(200), price int, active varchar(10))";
	String r3 = "create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), country varchar(100), mobileNumber varchar(20), orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(10))";
	//System.out.print(r1);
	//System.out.print(r2);
	System.out.print(r3);
	//st.execute(r1);
	//st.execute(r2);
	st.execute(r3);
	System.out.print("table created");
	con.close();
	
}catch(Exception e){
	System.out.print(e);
	
}
%>
