<!-- @author: Paurav Shah -->

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>LoginApp - Login</title>
    <link href="<c:url value="/resources/static/css/login.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/static/favicon/favicon-16x16.png"/>" rel="icon" type="image/png" sizes="16x16">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
	<script type="application/javascript">
		function onPageLoad(){
			if(sessionStorage.getItem("userId") != null){
				window.location.replace("http://localhost:8080/LoginApp/profile");
			}
		}
		
	 	function verifyUser(){
	 		var email = $('#email').val();
	 		var password = $('#password').val();
	 		
	 		if(email != ""){
	 			if(password != ""){
	 				$.ajax({
	         			type: "GET",
	         			url: "http://localhost:8080/LoginApp/verifyUser/" + email + "/" + password,
	         			context: document.body,
	         			success: function(result){
	         				console.log(result);
	         				alert('Login successful.');
	         				startSession(email);
	         			},
	         			error: function(error){
	         				console.log(error);
	         				alert('Invalid login credentials!');
	         			}
	         		});
	 			} else {
	 				alert('Please enter your password.');
	 			}
	 		} else {
	 			alert('Please enter your email.');
	 		}
	 	}
	 	
	 	function startSession(email){
	 		$.ajax({
	 			type: "GET",
	 			url: "http://localhost:8080/LoginApp/getUserId/" + email + "/",
	 			context: document.body,
	 			success: function(userId){
					sessionStorage.setItem("userId", userId);
					sessionStorage.setItem("email", email);
	 				window.location.replace("http://localhost:8080/LoginApp/profile");
	 			},
	 			error: function(error){
	 				console.log(error);
	 			}
	 		});
	 	}
	</script>
</head>
<body onload="onPageLoad()">
    <div class="container">
		<div class="box">
			<div class="boxdiv1">
				<h3 id="heading">LoginApp</h3>
			</div>
			<div class="boxdiv2">
				<form id="login-form" autocomplete="on">
				  <div class="mb-3">
				    <label for="email" class="form-label">Email<span style="color: red;">&#42;</span></label>
				    <input type="email" class="form-control" id="email" name="email" autofocus required>
				  </div>
				  <div class="mb-3">
				    <label for="password" class="form-label">Password<span style="color: red;">&#42;</span></label>
				    <input type="password" class="form-control" id="password" name="password" required> 
				  </div>
				  <div class="login">
				  	<button type="button" id="login-btn" class="btn btn-primary" onclick="verifyUser()">Login</button>
				  </div>
				</form>
			</div>
			<div class="boxdiv3">	
				<a id="registration-link" href="http://localhost:8080/LoginApp/register">New User (Register)</a>
			</div>
		</div>
	</div>
</body>
</html>
