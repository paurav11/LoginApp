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
    <script src="<c:url value="/resources/static/js/profile.js"/>" type="application/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
 	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
 	<script type="application/javascript">
 		function onPageLoad(){
 			if(sessionStorage.getItem("userId") != null){
 				document.getElementById("welcome-message").innerHTML = "Welcome, " + sessionStorage.getItem("email") + "!";
 			} else {
 				window.location.replace("http://localhost:8080/LoginApp/login");
 			}
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
			<h4 id="welcome-message"></h4>
			<br>
			<button type="button" id="logout-btn" class="btn btn-primary" onclick="logout()">Logout</button>
   		</div>
    </div>
</body>
</html>