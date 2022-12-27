<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>
<%@include file="header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
</head>
<body>
<h1 class="cart-title">Mon panier</h1>

<%
String msg= request.getParameter("msg");
if ("notPossible".equals(msg)){
	
%>
<p class="alert">Il ne reste qu'un seul produit cliquez sur supprimer</p>
	
<%} %>



<%
if ("removed".equals(msg)){
%>
<p class="alert">le produit a été supprimé du panier</p>
<%} %>










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

       
         
        <%
        ResultSet rs = st.executeQuery("select * from books inner join cart on books.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while(rs.next()){
        %>
      
          
           <%sno++; %>
          <div class="cart-container">
            <img src="<%=rs.getString(7) %>">
            <p><%=rs.getString(2) %></p>
            <p>: <%=rs.getString(3) %></p>
            <p><b><%=rs.getString(4) %></b> <i class="fa-solid fa-euro-sign"></i> </p>
            <div><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class="fa-solid fa-circle-minus"></i></a> <%=rs.getString(9) %>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"><i class="fa-solid fa-circle-plus"></i></a></div>
            <p><%=rs.getString(12) %> </p>
            <a href="removeFromCart.jsp?id=<%=rs.getString(1) %>">Supprimer <i class='fas fa-trash-alt'></i></a>
         </div>
         
          
        <%
           }
         }catch(Exception e){
        	 System.out.println(e);
        	 
         }
        %>
         <div class="checkout-container">
                  <p class="total">Total : <b><%out.println(total); %></b> <i class="fa-solid fa-euro-sign"></i> </p>
         <%if(total > 0){ %><button type="button" class="btn btn-primary"><a class="checkout-text" href="addressPaymentForOrder.jsp">Procéder au paiement</a></button><%} %>
        </div>

<%@include file="footer.jsp" %>
</body>
</html>