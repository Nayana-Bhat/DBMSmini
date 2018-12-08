<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="xyz.jpg">
<center>
Book returned successfully.<br><br>
-------------------------------------------------------------------------
<br><br>
<%
String bid=(String)request.getAttribute("bid");
out.println("Book ID:"+ bid);
%>
<br><br>
<%
String bname=(String)request.getAttribute("bname");
out.println("Book Name:"+ bname);
%>
<br><br>
<%
String rdate=(String)request.getAttribute("rdate");
out.println("Book Due Date:"+ rdate);
%>
<br><br>
<%
String cdate=(String)request.getAttribute("cdate");
out.println("Book Return Date:"+ cdate);
%>
<br><br>
<%
long fine=(long)request.getAttribute("fine");
if(fine>0)
out.println("Fine:"+ fine);
else 
out.println("Fine: 0");
%>
<br><br>

------------------------------------------------------------------------

<form action="index.jsp" method="get">
<input type="submit" value="logout">
</form>
</center>

</body>
</html>