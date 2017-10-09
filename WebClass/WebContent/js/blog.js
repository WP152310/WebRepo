function mainNavUpdate() {
	var doc = document.documentElement;
	var top = (window.pageYOffset || doc.scrollTop)  - (doc.clientTop || 0);
	var bottom = $('#main').position().top + $('#main').outerHeight(true);
	var about = $('#aboutContainer').position().top;
	var hobbies = $('#hobbiesContainer').position().top;
	var favorites = $('#favoritesContainer').position().top;
    if(top < bottom) {
    	document.getElementById('mainNav').style.opacity = top / bottom * 0.8;
    }
    else {
    	if(top < about){
    		$('#homeItem').attr('class', 'nav-item active');
    		$('#aboutItem').attr('class', 'nav-item');
	    	$('#hobbiesItem').attr('class', 'nav-item');
	    	$('#favoritesItem').attr('class', 'nav-item');
    	}
    	if(top >= about){
    		$('#homeItem').attr('class', 'nav-item');
	    	$('#aboutItem').attr('class', 'nav-item active');
	    	$('#hobbiesItem').attr('class', 'nav-item');
	    	$('#favoritesItem').attr('class', 'nav-item');
    	}
    	if(top >= hobbies){
    		$('#homeItem').attr('class', 'nav-item');
    		$('#aboutItem').attr('class', 'nav-item');
	    	$('#hobbiesItem').attr('class', 'nav-item active');
	    	$('#favoritesItem').attr('class', 'nav-item');
    	}
    	if(top >= favorites){
    		$('#homeItem').attr('class', 'nav-item');
    		$('#aboutItem').attr('class', 'nav-item');
	    	$('#hobbiesItem').attr('class', 'nav-item');
	    	$('#favoritesItem').attr('class', 'nav-item active');
    	}
    }
    if(top == 0){
    	$('#mainNav').hide();
    }
    else{
    	$('#mainNav').show();
    }
}
function mainBtnUpdate(){
	if($(window).width() < 900) {			
		$('.display-inline').attr('class', 'display-not-inline');
		$('.main-button-div').attr('class', 'main-button-div main-button-div-not-inline');
		$('.main-button-img').attr('style', 'width: 50%; height: 50%')
		$('.main-button').attr('class', 'main-button-not-inline')
		if($(window).height() < 900) {			
			document.getElementById('main-title').innerHTML = "";
		}
		else {
			document.getElementById('main-title').innerHTML = "Freiyer";
		}
	}
	else {
		$('.display-not-inline').attr('class', 'display-inline');
		$('.main-button-div').attr('class', 'main-button-div');
		$('.main-button-img').attr('style', '')
		$('.main-button-not-inline').attr('class', 'main-button')
		if($(window).height() < 650) {			
			document.getElementById('main-title').innerHTML = "";
		}
		else {
			document.getElementById('main-title').innerHTML = "Freiyer";
		}
	}
}
function collapseNav(){
	$('.collapse').collapse('hide');
}
$(document).ready(
	function () {
		document.getElementById('mainNav').style.opacity = 0.8;
		mainNavUpdate();
		mainBtnUpdate();
		$('#loginForm').submit(
			function (event) {
	    		event.preventDefault();
	    		
	    		//id, pwd 값을 가져오기
	    		//document.getElementById("id").value
	    		var id = $('#id').val();
	    		var pwd = $('#pwd').val();
	    		
	    		//서버로 POST 방식으로 전송
	    		$.post("/WebClass/bloglogin", { id: id, pwd: pwd },
	    			function(data) {
	    				if(data.msg == 'error') {
	    					$('#signinModal').modal('hide');
	    					var resultModal = $('#resultModal')
		    				resultModal.modal();
	    					resultModal.find('.modal-body').text('Sign-In failed.');
	    					//resultModal.find('.resultModalCloseBtn').attr('onclick', '');
	    					$('#resultModal').on('hide.bs.modal', function () {
	    						$("#signinModal").modal();
	    					})
	    				}
	    				else {
	    					$('#signinModal').modal('hide');
	    					var resultModal = $('#resultModal')
		    				resultModal.modal();
	    					console.log(data);
	    					resultModal.find('.modal-body').text('Welcome, ' + data.name + '.');
	    					$('#resultModal').on('hide.bs.modal', function () {
	    						location.reload();
	    					})
	    				}
	    			}
	    		);
			}
		);
		$('#registerForm').submit(
			function (event) {
				event.preventDefault();
				
				var grade = $('input[name="grade"]:checked').val();
				var cls = document.getElementById('cls').innerHTML;
				var num = $('#num').val();
				var name = $('#name').val();
				console.log("signup", grade, cls, num, name);
				$.post("/WebClass/register", { grade: grade, cls: cls, num: num, name: name },
					function(data) {
						console.log("received")
						var resultModal = $('#resultModal')
						resultModal.find('.modal-body').text('Welcome, ' + data.name + '!');
						resultModal.modal();
						$('#registerModal').modal('hide');
					}
				);
			}    				
		);
		$(window).scroll(mainNavUpdate);
		$(window).resize(mainBtnUpdate);
	}
);
$(document).on('click', 'a', function(event){
    event.preventDefault();

    var href = $.attr(this, 'href');
    if(href != '#'){
    	$('html, body').animate({
            scrollTop: $(href).offset().top
    	}, 500);
    }
});