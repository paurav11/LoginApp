<!-- @author: Paurav Shah -->

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page isELIgnored="false"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>LoginApp - Profile</title>
	<link href="<c:url value="/resources/static/css/profile.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/static/favicon/favicon-16x16.png"/>" rel="icon" type="image/png" sizes="16x16">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
 	<script type="application/javascript">
 		function onPageLoad(){
 			if(sessionStorage.getItem("userId") != null){
 				getUser();
 			} else {
 				window.location.replace("http://localhost:8080/LoginApp/login");
 			}
 		}
 		
 		function getUser(){
 			$.ajax({
     			type: "GET",
     			url: "http://localhost:8080/LoginApp/getUser/" + sessionStorage.getItem("email") + "/",
     			context: document.body,
     			success: function(result){
     				console.log(result);
     				var user = JSON.parse(JSON.stringify(result));
     				sessionStorage.setItem("firstName", user[0].firstName);
     				sessionStorage.setItem("lastName", user[0].lastName);
     				sessionStorage.setItem("mobileNumber", user[0].mobileNumber);
     				sessionStorage.setItem("dob", user[0].dob);
     				sessionStorage.setItem("gender", user[0].gender);
     				sessionStorage.setItem("userCreatedOn", user[0].userCreatedOn);
     				document.getElementById("name").innerHTML = sessionStorage.getItem("firstName") + " " + sessionStorage.getItem("lastName");
     				document.getElementById("email").innerHTML = sessionStorage.getItem("email");
     				document.getElementById("mobile-number").innerHTML = sessionStorage.getItem("mobileNumber");
     				document.getElementById("dob").innerHTML = sessionStorage.getItem("dob");
     				document.getElementById("gender").innerHTML = sessionStorage.getItem("gender");
     				document.getElementById("user-created-on").innerHTML = sessionStorage.getItem("userCreatedOn");
     			},
     			error: function(error){
     				console.log(error);
     			}
     		});
 		}	
 	
	 	function logout(){
	 		sessionStorage.clear();
	 		window.location.replace("http://localhost:8080/LoginApp/login");
	 	}
 	</script>
</head>
<body onload="onPageLoad()">
	<div class="container">
   		<div class="box">
   			<div class="boxdiv1">
				<h3 id="heading">LoginApp</h3>
			</div>
			<br>
			<h6 id="user-profile-title">User Profile</h6>
			<br>
			<table class="table table-bordered table-striped table-hover table-responsive">
			  <tbody>
			    <tr>
			      <td>Name</td>
			      <td id="name"></td>
			    </tr>
			    <tr>
			      <td>Email</td>
			      <td id="email"></td>
			    </tr>
			    <tr>
			      <td>Mobile No</td>
			      <td id="mobile-number"></td>
			    </tr>
			    <tr>
			      <td>Date of Birth</td>
			      <td id="dob"></td>
			    </tr>
			    <tr>
			      <td>Gender</td>
			      <td id="gender"></td>
			    </tr>
			    <tr>
			      <td>Account Created</td>
			      <td id="user-created-on"></td>
			    </tr>
			  </tbody>
			</table>
			<br>
			<button type="button" id="logout-btn" class="btn btn-primary" onclick="logout()">Logout</button>
   		</div>
    </div>
</body>
</html>