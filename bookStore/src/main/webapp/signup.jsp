<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<title>Signup</title>
</head>
<body>
<h2 class="sign-title">Créer un Compte</h2>
<div id='container'>
  <div class='signup'>
  <form action="signUpAction.jsp" method="post">
   <div class="mb-3">
    <input type="text" class="form-control"  name="name" placeholder="votre nom">
   </div>
   <div class="mb-3">
    <input type="email" class="form-control" name="email" placeholder="votre email">
   </div>
   <div class="mb-3">
    <input type="text" class="form-control" name="mobileNumber" placeholder="votre téléphone">
   </div>
   <div class="mb-3">
    <input type="password" class="form-control" name="password" placeholder="votre mot de passe">
   </div>
    <div class="sign-button">
    <button type="submit" class="btn btn-primary">Sign Up</button>
    <p><a href="login.jsp">Login</a></p>
    </div>
  </form>
    
      
  </div>
  <div class='whysign'>
    <%
    String msg = request.getParameter("msg");
    if("valid".equals(msg)){
    %>
	<h3>Compte crée avec succés</h3>
	
    <% } %>

    <%
    if("invalid".equals(msg)){
    %>
	<p class="loginError">Une erreur s'est produite</p>
    <% } %>

    
  </div>
</div>

</body>
</html>