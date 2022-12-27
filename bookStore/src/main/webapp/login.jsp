<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>
<body>
<h2 class="sign-title">Se Connecter</h2>
 <div>
 <form action="loginAction.jsp" class="form_container" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1">
  </div>
   <div class="sign-button">
    <button type="submit" class="btn btn-primary">Login</button>
    <p><a href="signup.jsp">SignUp</a></p>
   </div>
</form>
      
      
  </div>
  <div class='loginMsg'>
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

 


  </div>

</body>
</html>