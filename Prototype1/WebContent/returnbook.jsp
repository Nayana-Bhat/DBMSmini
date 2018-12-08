<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Return book</title>
</head>
<body background="xyz.jpg">
<center>
<form action="Rbook" method="post">
<center>
Please Enter the book details:<br><br>
Book ID:<input type="text" name="bid"><br><br>
Book Name:<input type="text" name="bname"><br><br>
<%--Due Date:<input type="text" name="rdate">--%>
Current Date:<input type="text" name="cdate"> <br><br>
<input type="submit" value="submit"><br><br>
<input type="reset" value="reset"><br><br>

</center>

</form>
<form action="customer.jsp" method="post">

<input type="submit" name="logout" value="logout">

</form>
</center>
</body>
</html>