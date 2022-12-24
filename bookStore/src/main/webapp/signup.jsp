<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="signUpAction.jsp" method="post">
    <input type="text" name="name" placeholder="votre nom">
    <input type="email" name="email" placeholder="votre email">
    <input type="text" name="mobileNumber" placeholder="votre téléphone">
    <input type="password" name="password" placeholder="votre mot de passe">
    <input type="submit" value="sign up">
  </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
    <%
    String msg = request.getParameter("msg");
    if("valid".equals(msg)){
    %>
	<h1>Compte crée avec succés</h1>
	
    <% } %>

    <%
    if("invalid".equals(msg)){
    %>
	<h1>Une erreur s'est produite</h1>
    <% } %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>