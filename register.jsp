<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<h1 class="">Registration Form</h1>
	<hr>
	<form class="" action="register_logic.jsp" method="post">
		<table>
<tr>
			<td><label>User Type: </label></td>
		<td>
			<select name="utype">
			<option value="faculty">Faculty</option>
			<option value="student">Student</option>
			</select>
		</td>
</tr>
<tr><td><strong style="text-align:center">Login Details<hr></strong></td></tr>
<tr>
		<td><label>User ID: </label></td>
		<td><input type="text" name="userid"></td>
</tr>
<tr>		<td><label>Password: </label></td>
		<td><input type="password" name="pass"></td>
</tr>
<tr>		<td><strong style="text-align:center">Personal Details<hr></strong></td> </tr>		
<tr>		<td><label>First Name: </label></td>
		<td><input type="text" name="ufName"></td>
</tr>
<tr>		<td><label>Last Name: </label></td>
		<td><input type="text" name="ulName"></td>
</tr>
<tr>		<td><label>Date of Birth: </label></td>
		<td><input type="date" name="udob"></td>
</tr>
<tr>		<td><label>Gender: </label></td></tr>
<tr>		<td><input type="radio" name="gender" value="male">Male &nbsp; <input type="radio" name="gender" value="female">Female</td></tr>
<tr>		<td><label>Graduate: </label></td></tr>
<tr>		<td><input type="radio" name="graduate" value="yes">Yes &nbsp; <input type="radio" name="graduate" value="no" checked>No</td></tr>
<tr>		<td><label>Post Graduate: </label></td></tr>
<tr>		<td><input type="radio" name="postgrad" value="yes">Yes &nbsp; <input type="radio" name="postgrad" value="no" checked>No</td></tr>
<tr>		<td><strong style="text-align:center">Contact Details<hr></strong></td></tr>
<tr>		<td><label>Street Name</label></td>
<td>		<input type="text" name="street"></td>
</tr>
<tr>		<td><label>City Name</label></td>
		<td><input type="text" name="city"></td>
</tr>
<tr>		<td><label>State</label></td>
		<td><input type="text" name="state"></td>
</tr>
<tr>		<td><label>Country</label></td>
		<td><input type="text" name="country"></td>
</tr>
<tr>		<td><label>Zip Code</label></td>
		<td><input type="text" name="zipcode"></td>
</tr>
<tr>		<td><label>Email: </label></td>
		<td><input type="email" name="email_id"></td>
</tr>
<tr>		<td><label>Phone</label></td>
		<td><input type="text" name="phoneno"></td>
</tr>
<tr>	<td><input type="submit" value="Enter Details"></td>
</tr>
	</form>
	</div>
</body>
</html>
