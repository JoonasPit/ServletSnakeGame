<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		        <link rel="stylesheet" href ="${pageContext.request.contextPath}/css/styles.css">
			<link href="https://fonts.googleapis.com/css?family=Bungee+Inline" rel="stylesheet"> 
<link href="https://fonts.googleapis.com/css?family=Oxygen" rel="stylesheet"> 

<title>Projektin etusivu</title>
</head>
<body>
<h1>Hieno Projekti</h1>

<!-- Not necessary tbf -->
<div id = "topbar"/>
<div id = "form_div">
<form action = "devpro" method = "post" id = "formm">
<p>Type in your username</p>
<input type = "text" name = "userName" placeholder = "Username" class = "inputfield"><div class = "emptyerr"><c:out value="${emptyuserError}"></c:out></div>
<p>Choose your color</p>
<input type = "radio"  name = "color" value = "green" checked class = "radio"> Green
<input type = "radio" name = "color" value = "blue" class = "radio"> Blue
<input type = "radio" name = "color" value = "yellow" class = "radio"> Yellow<br><br>
<input type = "submit" value = Submit class = "button">
</form>
</div>
</body>
</html>
