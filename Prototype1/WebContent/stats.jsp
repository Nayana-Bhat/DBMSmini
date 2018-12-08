<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>COMPLETE REFERNCE</title>
</head>
<body background="xyz.jpg">
<center><br><br>
<br><br>
-----------------------------------------------------------------------------------------
<br><br>
<b>SELECT ONE:</b>
<form action="stats1.jsp" method="post">
<br>
<input type="submit" name="BOOKS" value="BOOKS">
</form>
<br>
<form action="stats2.jsp" method="post">
<br>
<input type="submit" name="JOURNALS" value="JOURNALS">
</form>
<br>
<br><br>
-----------------------------------------------------------------------------------------
<br><br>
<form action="successloge.jsp" method="post">
<br>
<input type="submit" name="back" value="back">
</form>
<br>
<form action="employee.jsp" method="post">
<br>
<input type="submit" name="logout" value="logout">
</form>
</center>
</body>
</html>