<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>


<html>
<head>
<meta charset="UTF-8">
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
<div style="color: white; text-align: center; font-size: 30px;">Manga Store<i class="fa fa-institution"></i></div>
<%
String msg = request.getParameter("msg");
if("added".equals(msg)){
%>
	<h3 class="alert">livre ajouté au panier</h3>
<%} %>

<%
if("exist".equals(msg)){
%>
	<h3 class="alert">Product already exist in you cart! Quantity  increased!</h3>
<%} %>

<div class="super_container">
<%
try {
	Connection con = ConnectionHandler.getCon();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from books ORDER BY name DESC LIMIT 12");
	while(rs.next()){
		
%>	
    
      <div class="product_container">
            <img src="<%=rs.getString(6)%>">
            <p class="title"><%=rs.getString(2)%></p>
            <p><%=rs.getString(3)%></p>
            <p><%=rs.getString(4)%></p>
            <p><a href="addToCartAction.jsp?id=<%=rs.getString(1)%>">Ajouter au panier <i class='fas fa-cart-plus'></i></a></p>
         
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