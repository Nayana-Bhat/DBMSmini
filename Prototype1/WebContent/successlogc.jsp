<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome </title>
</head>
<body background="xyz.jpg">
<center>
<h3><b>


<%
String uname=(String)request.getAttribute("uname");
int cid=(int)request.getAttribute("cid");

out.println("Welcome  "+ uname);
out.println("Customer ID:  "+ cid);

%>
</b></h3>
<br><br>
Select your choice:<br><br>

<p>
<u><b>BOOKS</b></u><br><br>
1. Borrow Book:<br>
<a href="issuenew.jsp">Click to borrow a book</a><br>
<br>
2. Return Book:<br>
<a href="returnbook.jsp">Click to return a book</a><br><br>
</p>
<br>

<p>
<u><b>JOURNALS</b></u><br><br>
1. Borrow Journal:<br>
<a href="issuenewj.jsp">Click to borrow a journal</a><br>
<br>
2. Return Journal:<br>
<a href="returnj.jsp">Click to return a journal</a><br><br>
</p>
<br>
<form action="customer.jsp" method="post">

<input type="submit" name="logout" value="logout">

</form>
</center>
</body>
</html>