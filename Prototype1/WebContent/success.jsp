<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SUCCESS</title>
</head>
<body background="xyz.jpg">
<center>
----------------------------------------------------------------------
<br><br>
<%
String value=(String)request.getAttribute("value");
out.println(  "ACTION SUCCESSFULLY COMPLETED");

%>
<br><br>

----------------------------------------------------------------------

<br><br>
<form action="employee.jsp" method="post">
<input type="submit" value="logout">
</form>

</center>

</body>
</html>