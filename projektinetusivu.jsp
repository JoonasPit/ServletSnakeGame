<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		        <link rel="stylesheet" href ="css/styles.css">
			<link href="https://fonts.googleapis.com/css?family=Bungee+Inline" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Oxygen" rel="stylesheet"> 

<title>Projektin etusivu</title>
</head>
<body>
<h1>Hieno Projekti</h1>
<div class="topnav">
	<!-- Don't do anything yet -->
		<a href="">Front Page</a>
	  	<a href="">Log In</a>
		<a href="">Placeholder</a>
</div>

<form action = "devpro" method = "post">
<p>Type in your username</p>
<input type = "text" name = "userName" placeholder = "Username" class = "inputfield">
<p>Choose your color</p>
<input type = "radio"  name = "color" value = "green" checked class = "radio"> Green
<input type = "radio" name = "color" value = "blue" class = "radio"> Blue
<input type = "radio" name = "color" value = "yellow" class = "radio"> Yellow<br>
<input type = "submit" value = Submit class = "button">
</form>
</body>
</html>
