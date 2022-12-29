<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">


<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Book Store<i class="fa fa-institution"></i></div>
<%
String msg = request.getParameter("msg");
if("added".equals(msg)){
%>
	<h3 class="alert">livre ajouté au panier</h3>
<%} %>

<%
if("exist".equals(msg)){
%>
	<h3 class="alert">Le produit existe dejà dans votre panier, la quantité a été augmenté </h3>
<%} %>

<div class="super_container">
<%
try {
	Connection con = ConnectionHandler.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from books LIMIT 45");
	while(rs.next()){
		
%>	
    
      <div class="product_container">
            <img src="<%=rs.getString(6)%>">
            <p class="title"><%=rs.getString(2)%></p>
            <p><%=rs.getString(3)%></p>
             <p><%=rs.getString(1)%></p>
            <p><b><%=rs.getString(4)%></b> <i class="fa-solid fa-euro-sign"></i>  </p>
            <button type="button" class="btn btn-primary"><a class="addToCart" href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Ajouter au panier <i class='fas fa-cart-plus'></i></a></button>
         
     </div>	
   
<%
}
}catch(Exception e){
	System.out.println(e);
	
}
%>
        

</div> 
          
<%@include file="footer.jsp" %>
</body>
</html>