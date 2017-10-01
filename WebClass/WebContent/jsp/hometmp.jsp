<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script>
    function menu_over(e){
    	e.setAttribute("class", "nav-item active");
    }
    
    function menu_out(e){
    	e.setAttribute("class", "nav-item")
    }
    
    </script>
<style>
.container {
	padding-top: 100px;
}

.transparent-input {
	background-color: rgba(0, 0, 0, 0) !important;
	border: none !important;
	color: rgba(20, 20, 20, 256);
}

body, html {
	height: 100%;
}

.parallax {
	background-image: url("Screenshot.png");
	height: 100%;
	background-attachment: fixed;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<link rel="stylesheet" href="../css/footer.css">

</head>
<body>
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
		<!--
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
    -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target=".dual-collapse">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="navbar-collapse collapse dual-collapse">
			<ul class="nav navbar-nav">
				<%@include file="menu.jsp"%>
			</ul>
		</div>
		<a class="navbar-brand d-flex mx-auto" href="#">Freiyer</a>

		<div class="navbar-collapse collapse dual-collapse" id="navbarNav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item" onmouseover="menu_over(this)"
					onmouseout="menu_out(this)"><a class="nav-link"
					onclick="$('#registerModal').modal()">Sign Up</a></li>
				<li class="nav-item" onmouseover="menu_over(this)"
					onmouseout="menu_out(this)"><a class="nav-link"
					onclick="$('#signinModal').modal()">Sign In</a></li>
			</ul>
		</div>
	</nav>
	<%@ include file="footer.jsp"%>

	<!-- Modal -->
	<div class="modal fade" id="resultModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Result</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- RegisterModal -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ModalLabel">Sign-up</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="registerForm">
					<div class="modal-body">
						<input class="form-control mr-sm-2 transparent-input" size="30"
							type="text" placeholder="Grade" aria-label="Grade" id="grade"
							required>
						<p></p>
						<input class="form-control mr-sm-2 transparent-input" type="text"
							placeholder="Class" aria-label="Class" id="cls" required>
						<p></p>
						<input class="form-control mr-sm-2 transparent-input" type="text"
							placeholder="Number" aria-label="Number" id="num" required>
						<p></p>
						<input class="form-control mr-sm-2 transparent-input" type="text"
							placeholder="Name" aria-label="Name" id="name" required>
					</div>
					<div class="modal-footer">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign
							Up</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- LoginModal -->
	<div class="modal fade" id="signinModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="ModalLabel">Sign-In</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form id="loginForm">
					<div class="modal-body">
						<input class="form-control mr-sm-4g transparent-input" type="text"
							placeholder="ID" aria-label="ID" id="id" required>
						<p></p>
						<input class="form-control mr-sm-4g transparent-input"
							type="password" placeholder="Password" aria-label="Password"
							id="pwd" required>
					</div>
					<div class="modal-footer">
						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Sign
							In</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
		integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
		crossorigin="anonymous"></script>

	<script>
    $(document).ready(
    	function () {
    		$('#loginForm').submit(
    			function (event) {
		    		event.preventDefault();
		    		
		    		//id, pwd 값을 가져오기
		    		//document.getElementById("id").value
		    		var id = $('#id').val();
		    		var pwd = $('#pwd').val();
		    		console.log(id, pwd);
		    		
		    		//서버로 POST 방식으로 전송
		    		$.post("http://httpbin.org/post", { id: id, pwd: pwd },
		    			function(data) {
		    				var resultModal = $('#resultModal')
		    				resultModal.modal();
		    				resultModal.find('.modal-body').text(data.form.id + '님 로그인되었습니다.');
		    				$('#signinModal').modal('hide');
		    			}
		    		);
    			}
    		);
    		$('#registerForm').submit(
				function (event) {
					event.preventDefault();
					
					var grade = $('#grade').val();
					var cls = $('#cls').val();
					var num = $('#num').val();
					var name = $('#name').val();
					console.log("signup", grade, cls, num, name);
					$.post("http://httpbin.org/post", { grade: grade, cls: cls, num: num, name: name },
						function(data) {
							console.log("received")
							var resultModal = $('#resultModal')
							resultModal.find('.modal-body').text(data.form.name + '님 회원가입 되었습니다.');
							resultModal.modal();
							$('#registerModal').modal('hide');
						}
					);
				}    				
    		)
    	}
    );
    $(document).on('click', 'a', function(event){
        event.preventDefault();

        $('html, body').animate({
            scrollTop: $( $.attr(this, 'href') ).offset().top
        }, 500);
    });
    </script>

	<a id="menu1"></a>
	<div class="parallax"></div>
	<div class="container parallax">
		<h1>Menu1</h1>

	</div>

	<a id="menu2"></a>
	<div class="container">
		<h1>Menu2</h1>
		<div class="dropdown">
			<button class="btn btn-secondary dropdown-toggle" type="button"
				id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false">Dropdown button</button>
			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item" href="#">Action</a> <a
					class="dropdown-item" href="#">Another action</a> <a
					class="dropdown-item" href="#">Something else here</a>
			</div>
		</div>

	</div>

	<a id="menu3"></a>
	<div class="container">
		<h1>Menu3</h1>

	</div>
</body>
</html>