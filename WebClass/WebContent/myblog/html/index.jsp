<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<title>Freiyer</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <script src="../../js/menu-over-out.js"></script>
    <link rel="stylesheet" type="text/css" href="../../css/blog.css"> 
  </head>
<body>
<a id="home"></a>
<div id="main">
<div style="height: 16%">
	<div class="container text-right">
	<%
		if(session.getAttribute("user")==null){
	%>
     <a class="main-sign" onclick="$('#registerModal').modal()" href="#">Sign Up</a>
     <a class="main-sign" onclick="$('#signinModal').modal()" href="#">Sign In</a>
    <%
		} else {
    %>
     <form method="post" action="/WebClass/bloglogout">
     	<a class="main-sign" href="#"><%=((UserVO)session.getAttribute("user")).getName()%></a>
        <a class="main-sign" href="#" onclick="parentNode.submit()">Sign Out</a>
     </form>
    <%
		}
    %>
    </div>
</div>
<div style="height: 16%; text-align: center;"><h1 style="font-size: 500%;" id="main-title" class="main-text">Freiyer</h1></div>
<div class="main-button-div">
<div class="display-inline">
	<a href="#about">
  <img src="../../image/about.png" class="main-button-img" alt="About">
  </a>
  <div>
  	<p class="main-button">About</p>
  </div>
</div>
<div style="width: 100px; display: inline-block"></div>
<div class="display-inline">
<a href="#hobbies">
  <img src="../../image/hobbies.png" class="main-button-img" alt="Hobbies">
  </a>
  <div>
  	<p class="main-button">Hobbies</p>
  </div>
</div>
<div style="width: 100px; display: inline-block"></div>
<div class="display-inline">
<a href="#favorites">
  <img src="../../image/favorites.png" class="main-button-img" alt="Favorites">
  </a>
  <div>
  	<p class="main-button">Favorites</p>
  </div>
</div>
</div>
<div style="height: 33%"></div>
</div>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark" id="mainNav">
  <!--
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".dual-collapse">
        <span class="navbar-toggler-icon"></span>
    </button>
  <div class="navbar-collapse collapse dual-collapse">
    <ul class="nav navbar-nav">
      <li class="nav-item" id="homeItem">
        <a class="nav-link" href="#home" onclick="collapseNav()">Home</a>
      </li>
      <li class="nav-item" id="aboutItem">
        <a class="nav-link"  href="#about" onclick="collapseNav()">About</a>
      </li>
      <li class="nav-item" id="hobbiesItem">
        <a class="nav-link" href="#hobbies" onclick="collapseNav()">Hobbies</a>
      </li>
      <li class="nav-item" id="favoritesItem">
        <a class="nav-link" href="#favorites" onclick="collapseNav()">Favorites</a>
      </li>
    </ul>
    </div>
   <div class="navbar-brand d-flex mx-auto">Freiyer</div>
   <div class="navbar-collapse collapse dual-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <%
		if(session.getAttribute("user")==null){
	%>
     <li class="nav-item" onmouseover="menu_over(this)" onmouseout="menu_out(this)">
        <a class="nav-link" onclick="$('#registerModal').modal()" href="#">Sign Up</a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this)" onmouseout="menu_out(this)">
        <a class="nav-link" onclick="$('#signinModal').modal()" href="#">Sign In</a>
      </li>
    <%
		} else {
    %>
    <li class="nav-item" onmouseover="menu_over(this)" onmouseout="menu_out(this)">
        <a class="nav-link" href="#"><%=((UserVO)session.getAttribute("user")).getName()%></a>
      </li>
      <li class="nav-item" onmouseover="menu_over(this)" onmouseout="menu_out(this)">
      	<form method="post" action="/WebClass/bloglogout">
        	<a class="nav-link" href="#" onclick="parentNode.submit()">Sign Out</a>
        </form>
      </li>
    <%
		}
    %>
    </ul>
   </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Result</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary resultModalCloseBtn" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- RegisterModal -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="registerModalLabel">Sign-up</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
		  <form id="registerForm">
		      <div class="modal-body">
		      		<div class="form-control mr-sm-2 transparent-input">
		      		Grade 
		      		1 <input type="radio" name="grade" value="1" checked>
		      		2 <input type="radio" name="grade" value="2">
		      		3 <input type="radio" name="grade" value="3">
		      		</div>
		      		<p></p>
		      		<div class="form-control mr-sm-2 transparent-input">
		      		Class
					  <button class="btn btn-secondary dropdown-toggle transparent-input" type="button" id="cls" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					    1
					  </button>
					  <div class="dropdown-menu" aria-labelledby="cls">
					    <a class="dropdown-item" href="#" onclick="document.getElementById('cls').innerHTML='1'">1</a>
					    <a class="dropdown-item" href="#" onclick="document.getElementById('cls').innerHTML='2'">2</a>
					    <a class="dropdown-item" href="#" onclick="document.getElementById('cls').innerHTML='3'">3</a>
					    <a class="dropdown-item" href="#" onclick="document.getElementById('cls').innerHTML='4'">4</a>
					    <a class="dropdown-item" href="#" onclick="document.getElementById('cls').innerHTML='5'">5</a>
					    <a class="dropdown-item" href="#" onclick="document.getElementById('cls').innerHTML='6'">6</a>
					  </div>
					</div>
					<p></p>
			    	<input class="form-control mr-sm-2 transparent-input" type="text" placeholder="Number" aria-label="Number" id="num" required>
			    	<p></p> 
			    	<input class="form-control mr-sm-2 transparent-input" type="text" placeholder="Name" aria-label="Name" id="name" required>
			  </div>
			  <div class="modal-footer">
			  	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign Up</button>
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="location.reload()">Close</button>
	      	  </div>
		</form>
    </div>
  </div>
</div>

<!-- SigninModal -->
<div class="modal fade" id="signinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="signinModalLabel">Sign-In</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
		  <form id="loginForm">
		      	<div class="modal-body">
	    		<input class="form-control mr-sm-4g transparent-input" type="text" placeholder="ID" aria-label="ID" id="id" required>
	    		<p></p>
	    		<input class="form-control mr-sm-4g transparent-input" type="password" placeholder="Password" aria-label="Password" id="pwd" required>
			  </div>
			  <div class="modal-footer">
			  	<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign In</button>
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      	  </div>
		</form>
    </div>
  </div>
</div>

<a id="about"></a>  
<div style="height: 40px" id="aboutContainer"></div>
<div class="container">
<h1>
About
</h1>
<h2>Who I am</h2>
<p>
My name is Freiyer. I'm 16.
</p>
</div>


<a id="hobbies"></a>
<div style="height: 40px" id="hobbiesContainer"></div>
<div class="container">
<h1>
Hobbies
</h1>
<h2>Programming</h2>
<div class="card">
  <img class="card-img-top" src="https://isocpp.org/files/img/cpp_logo.png" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">C++</p>
  </div>
</div>
<div class="card">
  <img class="card-img-top" src="https://cdn.codementor.io/assets/tutors/c-sharp-tutors-online.png" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">C#</p>
  </div>
</div>
<h2>3d Modeling</h2>
<div class="card">
  <!--<img class="card-img-top" src="http://area.autodesk.com/userdata/avatar/5715231436b67.jpg" alt="Card image cap"> -->
  <div class="card-body">
    <p class="card-text">3ds Max</p>
  </div>
</div>
<div class="card">
  <!--<img class="card-img-top" src="http://area.autodesk.com/area_v2/assets/img/product/autodesk-maya.png" alt="Card image cap"> -->
  <div class="card-body">
    <p class="card-text">Maya</p>
  </div>
</div>
<div class="card">
  <!--<img class="card-img-top" src="http://area.autodesk.com/area_v2/assets/img/product/autodesk-mudbox.png" alt="Card image cap"> -->
  <div class="card-body">
    <p class="card-text">Mudbox</p>
  </div>
</div>
<h2>Languages</h2>
<div class="card">
  <img class="card-img-top" src="https://c.tadst.com/gfx/750w/english-language-day.jpg?1" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">English</p>
  </div>
</div>
<div class="card">
  <img class="card-img-top" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Nihongo.svg/75px-Nihongo.svg.png" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Japanese</p>
  </div>
</div>
<div class="card">
  <img class="card-img-top" src="http://4.bp.blogspot.com/-0eZdVF5dwAw/Ur39U5j7m_I/AAAAAAAAA1g/rXYUQEM3W48/s1600/302px-Hunmin_Jeongeum.svg.png" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Korean</p>
  </div>
</div>
</div>

<a id="favorites"></a>
<div style="height: 40px" id="favoritesContainer"></div>
<div class="container">
<h1>
Favorites
</h1>
<h2>Favorite Musics</h2>
<div class="card">
  <!--<img class="card-img-top" src="https://img.grouponcdn.com/deal/hfefAup1zQWBE2K8sWURgS27xax/hf-846x508/v1/c700x420.jpg" alt="Card image cap">-->
  <iframe class="card-img-top" width="320" height="180" src="https://www.youtube.com/embed/WQYN2P3E06s?rel=0&amp;controls=0&amp;showinfo=0" style="border: none;"></iframe>
  <div class="card-body">
    <p class="card-text">&quot;Sogno Di Volare&quot; by Christopher Tin</p>
  </div>
</div>
<h2>Favorite Foods</h2>
<div class="card">
  <img class="card-img-top" src="https://img.grouponcdn.com/deal/hfefAup1zQWBE2K8sWURgS27xax/hf-846x508/v1/c700x420.jpg" alt="Card image cap">
  <div class="card-body">
    <p class="card-text">Sushi</p>
  </div>
</div>
</div>
<div style="height: 300px"></div> 


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

<script src="../../js/blog.js"></script>
   
</body>
</html>