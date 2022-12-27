<%@page errorPage="error.jsp" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
<script src="https://kit.fontawesome.com/5c05bfc3b4.js" crossorigin="anonymous"></script>

</head>
<body>
    <!--Header-->
    
    <%String email=session.getAttribute("email").toString();
    try {
    	Connection con = ConnectionHandler.getCon();
    	Statement st = con.createStatement();
    	ResultSet rs = st.executeQuery("select * from users where email='"+email+"'");
    	while(rs.next()){
    
    %>
    
           
           <nav class="navbar">
  <div class="container">

    <div class="navbar-header">
      <button class="navbar-toggler" data-toggle="open-navbar1">
        <span></span>
        <span></span>
        <span></span>
      </button>
      <a href="#">
        <h4>Book<span>store</span></h4>
      </a>
    </div>

    <div class="navbar-menu" id="open-navbar1">
      <ul class="navbar-nav">
        <li class="active"><a href="home.jsp">Accueil</a></li>
        <li><a href="myCart.jsp">Panier</a></li>
        <li><a href="logout.jsp">Se déconnecter</a></li>
        <li><a class="userName" href=""><%=rs.getString(1)%></a></li>
      </ul>
    </div>
  </div>
</nav>
 <%
    	}
    	}catch(Exception e){
        	System.out.println(e);
        }
     %>

<script>


let dropdowns = document.querySelectorAll('.navbar .dropdown-toggler')
let dropdownIsOpen = false


if (dropdowns.length) {

dropdowns.forEach((dropdown) => {
 dropdown.addEventListener('click', (event) => {
   let target = document.querySelector(`#${event.target.dataset.dropdown}`)

   if (target) {
     if (target.classList.contains('show')) {
       target.classList.remove('show')
       dropdownIsOpen = false
     } else {
       target.classList.add('show')
       dropdownIsOpen = true
     }
   }
 })
})
}

//Handle closing dropdowns if a user clicked the body
window.addEventListener('mouseup', (event) => {
if (dropdownIsOpen) {
 dropdowns.forEach((dropdownButton) => {
   let dropdown = document.querySelector(`#${dropdownButton.dataset.dropdown}`)
   let targetIsDropdown = dropdown == event.target

   if (dropdownButton == event.target) {
     return
   }

   if ((!targetIsDropdown) && (!dropdown.contains(event.target))) {
     dropdown.classList.remove('show')
   }
 })
}
})

//Open links in mobiles
function handleSmallScreens() {
document.querySelector('.navbar-toggler')
 .addEventListener('click', () => {
   let navbarMenu = document.querySelector('.navbar-menu')

   if (!navbarMenu.classList.contains('active')) {
     navbarMenu.classList.add('active')
   } else {
     navbarMenu.classList.remove('active')
   }
 })
}

handleSmallScreens()

</script>
</body>
    
