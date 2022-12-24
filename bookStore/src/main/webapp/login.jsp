<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="loginAction.jsp" method="post">
    <input type="email" name="email" placeholder="votre email" required>
    <input type="password" name="password" placeholder="votre mot de passe" required>
    <input type="submit" value="login">
  </form>
     
      <h2><a href="signUp.jsp">SignUp</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  String msg = request.getParameter("msg");
  if("notexist".equals(msg)){
  %>
	  <h1>Nom d'utilisateur ou mot de passe incorrect</h1>
	  
  <%}%>
  
  <% 
  if("invalid".equals(msg)){
  %>
	  <h1>Une erreur s'est produite</h1>
	  
  <%}%>

 



    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

</body>
</html>