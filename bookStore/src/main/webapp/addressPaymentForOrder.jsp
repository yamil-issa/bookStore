<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">
<link rel="stylesheet" href="css/home-style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Home</title>

</head>
<body>
<br>
<table>
<thead>
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
          <tr>
          <th scope="col"><a href="myCart.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></th>
            <th scope="col" style="background-color: yellow;">Total:  <% out.println(total); %> </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col">price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
          </tr>
        </thead>
        <tbody>
    <%
        ResultSet rs = st.executeQuery("select * from books inner join cart on books.id=cart.product_id and cart.email='"+email+"' and cart.address is NULL");
        while(rs.next()){
    %>     
          <tr>
           <%sno++; %>
           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td><i class="fa fa-inr"></i><%=rs.getString(4) %></td>
            <td><%=rs.getString(8) %> </td>
            <td><i class="fa fa-inr"></i><%=rs.getString(10) %> </td>
            </tr>
         <% }
        ResultSet rs2 = st.executeQuery("select * from users where email='"+email+"'");
        while(rs2.next()){
        
          
         %>
        </tbody>
      </table>
      
<hr style="width: 100%">
<form action="AddressPaymentForOrderAction.jsp" method="post">
 <div class="left-div">
 <h3>Adresse</h3>
 <input class="input-style" type="text" name="address" value="<%=rs2.getString(5) %>" placeholder="votre adresse" required>

 </div>

<div class="right-div">
<h3>Ville</h3>
<input class="input-style" type="text" name="city" value="<%=rs2.getString(6) %>" placeholder="votre ville" required>

</div> 

<hr style="width: 100%">
<div class="left-div">
<h3>Votre type de carte</h3>
 <select class="input-style" name="paymentMethod">
 <option value="visa">visa</option>
 <option value="mc">Master Card</option>
 </select>
</div>

<div class="right-div">
 <input class="input-style" type="text" name="CardNumber" placeholder="numero de la carte" required>
 <input class="input-style" type="text" name="CardName" placeholder="nom sur la carte" required>
 <input class="input-style" type="text" name="cvc" placeholder="CVC" required>
</div>


<div class="left-div">
<h3>Numero de téléphone</h3>
<input class="input-style" type="text" name="mobilePhone" value="<%=rs2.getString(3) %>" placeholder="votre numero de téléphone" required>
<h3 style="color: red">*This mobile number will also updated to your profile</h3>
</div>
<div class="right-div">
<h3 style="color: red">*If you enter wrong transaction id then your order will we can cancel!</h3>
<button class="button" type="submit">Procéder au paiement<i class='far fa-arrow-alt-circle-right'></i></button>
<h3 style="color: red">*Fill form correctly</h3>
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