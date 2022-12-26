<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>
<%
String msg= request.getParameter("msg");
if ("notPossible".equals(msg)){
	
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
	
<%} %>

<%
if ("inc".equals(msg)){
%>	
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>

<%
if ("dec".equals(msg)){
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>

<%
if ("removed".equals(msg)){
%>
<h3 class="alert">Product Successfully Removed!</h3>
<%} %>









<table>
<thead>
<%
int total = 0;
int sno = 0;
try {
	Connection con = ConnectionHandler.getCon();
	Statement st = con.createStatement();
	ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='"+email+"' and address is NULL");
	while(rs1.next()){
		total = rs1.getInt(1);
	}
	
%>

        
            <p>Total:<%out.println(total); %> </p>
            <%if(total > 0){ %><p><a href="addressPaymentForOrder.jsp">Paiement</a></p><%} %>
        
         
         
        <%
        ResultSet rs = st.executeQuery("select * from books inner join cart on books.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while(rs.next()){
        %>
      
          <tr>
           <%sno++; %>
           <p><%out.println(sno); %></p>
            <p><%=rs.getString(2) %></p>
            <p><%=rs.getString(3) %></p>
            <p><i class="fa fa-inr"></i><%=rs.getString(4) %> </p>
            <p><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class='fas fa-plus-circle'></i></a><%=rs.getString(8) %>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a></p>
            <p><i class="fa fa-inr"></i><%=rs.getString(11) %> </p>
            <p><a href="removeFromCart.jsp?id=<%=rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></p>
          </tr>
          
        <%
           }
         }catch(Exception e){
        	 System.out.println(e);
        	 
         }
        %>

        </tbody>
      </table>
      <br>
      <br>
      <br>
<%@include file="footer.jsp" %>
</body>
</html>