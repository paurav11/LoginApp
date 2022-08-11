<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginApp - Login</title>
        <link href="<c:url value="/resources/static/css/login.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/static/favicon/favicon-16x16.png"/>" rel="icon" type="image/png" sizes="16x16">
        <script src="<c:url value="/resources/static/js/login.js"/>" type="text/javascript"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">
    	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
    </head>
    <body>
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
					  	<button type="submit" id="login-btn" class="btn btn-primary">Login</button>
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
