<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginApp - Register</title>
        <link href="<c:url value="/resources/static/css/register.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/static/favicon/favicon-16x16.png"/>" rel="icon" type="image/png" sizes="16x16">
        <script src="<c:url value="/resources/static/js/register.js"/>" type="text/javascript"></script>
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
    				<form id="registration-form">
		              <div class="row">
		                <div class="col">
		                    <label for="first-name" class="form-label">First Name<span style="color: red;">&#42;</span></label>
		                    <input type="text" class="form-control" id="first-name" size="50" name="firstName" autofocus required>
		                </div>
		                <div class="col">
		                    <label for="last-name" class="form-label">Last Name<span style="color: red;">&#42;</span></label>
		                    <input type="text" class="form-control" id="last-name" size="50" name="lastName" required>
		                </div>
		              </div>
		              <br>
		              <div class="row">
		              	  <div class="col">
			                 <label for="email" class="form-label">Email<span style="color: red;">&#42;</span></label>
			                 <input type="email" class="form-control" id="email" size="50" pattern="[a-zA-Z0-9._-]+@[a-z0-9.-]+\.[a-zA-Z]+" name="email" aria-describedby="emailHelp" required>
			                 <div id="emailHelp" class="form-text">e.g. abc@example.com</div>
			              </div>
			              <div class="col">
		                     <label for="mobileNumber" class="form-label">Mobile<span style="color: red;">&#42;</span></label>
		                     <input type="tel" class="form-control" id="mobileNumber" name="mobile" pattern="[0-9]{10}" aria-describedby="mobileHelp" required>
		                     <div id="mobileHelp" class="form-text">e.g. 9778457378</div>
		                  </div>
		              </div>
		              <br>
		              <div class="row">
		              	<div class="col">
		                     <label for="dob" class="form-label">Date of Birth<span style="color: red;">&#42;</span></label>
		                     <input type="date" step="1" max="2004-12-31" class="form-control" id="dob" name="dob" required>
		                  </div>
		                <div class="col">
		                    <label for="gender" class="form-label">Gender<span style="color: red;">&#42;</span></label>
		                    <select id="gender" class="form-select" name="gender" required>
		                        <option>Male</option>
		                        <option>Female</option>
		                        <option>Other</option>
		                    </select>
		                </div>
		              </div>
		              <br>
		              <div class="row">
		              	<div class="col">
						   <label for="password" class="form-label">Password<span style="color: red;">*</span></label>
						   <input type="password" class="form-control" id="password" aria-describedby="passwordHelp"> 
						   <div id="passwordHelp" class="form-text">Password can have 8-20 characters.</div>
						</div>
						<div class="col">
						   <label for="confirmPassword" class="form-label">Confirm Password<span style="color: red;">&#42;</span></label>
						   <input type="password" class="form-control" id="confirmPassword">
						</div>
		              </div>
		              <div class="register">
		                <button type="submit" id="register-btn" class="btn btn-primary">Register</button>
		              </div>
	            	</form>
    			</div>
    			<div class="boxdiv3">	
    				<a id="login-link" href="http://localhost:8080/LoginApp/login">Already an user? (Login)</a>
    			</div>
    		</div>
    	</div>
    </body>
</html>
