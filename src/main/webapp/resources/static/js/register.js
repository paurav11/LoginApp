function resetForm(){
	document.getElementById("registration-form").reset();
}

function validateUser(){
	var firstName = $('#first-name').val();
    var lastName = $('#last-name').val();
	var emailId = $('#email').val();
	var mobileNumber = $('#mobile-number').val();
	var dob = $('#dob').val();
	var password = $('#password').val();
	var confirmPassword = $('#confirm-password').val();
	var today = new Date().toISOString().slice(0, 10)
	
	if (firstName != "" && lastName != "" && emailId != "" && mobileNumber != "" && dob != "" && password != "" && confirmPassword != ""){
        var mailFormat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (emailId.match(mailFormat)){
            if(dob <= today){
				if(mobileNumber.length == 10){
					if(password.length >= 8 && password.length <= 20){
						if(password == confirmPassword){
							saveUser();
						} else {
							alert('Passwords does not match!');
						}
					} else {
						alert('Password length should be in the range (8-20)!');
					}
				} else {
					alert('Mobile number should have 10 digits!');
				}
			} else {
				alert('Please enter date that is less than or equal to ' + today + '!');
			}
        } else {
            alert('Please enter email in proper format!');
        }
    } else {
        alert('Please enter all required field(s)!');
    }
}
	
function saveUser(){
    var registrationFormData = {
        firstName: $('#first-name').val(),
        lastName: $('#last-name').val(),
        emailId: $('#email').val(),
        mobileNumber: $('#mobile-number').val(),
        dob: $('#dob').val(),
        gender: $('#gender').val(),
        password: $('#password').val()
    };
    $.ajax({
        type: "POST",
        url: "http://localhost:8080/LoginApp/saveUser",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify(registrationFormData),
        context: document.body,
        success: function(result){
			console.log(result);
            alert('Registration successful. Now you can login!');
            window.location.replace("http://localhost:8080/LoginApp/login");
        },
        error: function(error){
			console.log(error);
        	resetForm();
            alert('User account already exists! Try again with a different email.');
        }
    });
}