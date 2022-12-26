<%@page errorPage="error.jsp" %>
<%@page import="bookStore.ConnectionHandler" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
        <h4>Manga<span>store</span></h4>
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
    
