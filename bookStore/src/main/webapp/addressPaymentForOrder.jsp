<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/5c05bfc3b4.js" crossorigin="anonymous"></script>
<title>Home</title>

</head>
<body>
<br>

<%
String email = session.getAttribute("email").toString();
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
            <p><%=rs.getString(2) %></p>
            <p><%=rs.getString(3) %></p>
            <p><b><%=rs.getString(4) %></b> <i class="fa-solid fa-euro-sign"></i></p>
            <div class="checkout-quantity"><p><%=rs.getString(9) %> </p></div>
           </div>
           
         <% }
        ResultSet rs2 = st.executeQuery("select * from users where email='"+email+"'");
        while(rs2.next()){
        
          
         %>
       
     
      
<hr style="width: 100%">
<form action="AddressPaymentForOrderAction.jsp" method="post">
 <div class="mb-3">
 <h3>Adresse</h3>
 <input type="text" class="form-control" name="address" value="<%=rs2.getString(5) %>" placeholder="votre adresse" required>

 </div>

<div class="mb-3">
<h3>Ville</h3>
<input type="text" class="form-control"  name="city" value="<%=rs2.getString(6) %>" placeholder="votre ville" required>

</div> 

<hr style="width: 100%">
<div>
<h3>Votre type de carte</h3>
 <select class="form-select"name="paymentMethod">
 <option value="visa">visa</option>
 <option value="mc">Master Card</option>
 </select>
</div></br>

<div>
 <input type="text" class="form-control" type="text" name="CardNumber" placeholder="numero de la carte" required></br>
 <input type="text" class="form-control" type="text" name="CardName" placeholder="nom sur la carte" required></br>
 <input type="text" class="form-control" type="text" name="cvc" placeholder="CVC" required>
</div></br>


<div class="left-div">
<h3>Numero de téléphone</h3>
<input type="text" class="form-control" type="text" name="mobilePhone" value="<%=rs2.getString(3) %>" placeholder="votre numero de téléphone" required>
</div>
<div class="checkoutConfirmButton">
<p>Total:  <b><% out.println(total); %></b> <i class="fa-solid fa-euro-sign"></i> </p>
<button type="button" class="btn btn-primary" type="submit">Confirmer le paiement<i class='far fa-arrow-alt-circle-right'></i></button>
</div>
</form>
<% 
        }
}catch(Exception e){
	System.out.println(e);
}

%>
      <br>
      <br>
      <br>
<%@include file="footer.jsp" %>

</body>
</html>