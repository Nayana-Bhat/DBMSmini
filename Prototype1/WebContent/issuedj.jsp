<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>issue</title>
</head>
<body background="xyz.jpg">
<center>
Journal issued successfully.<br><br>
-------------------------------------------------------------------------
<br><br>
<%
String jid=(String)request.getAttribute("jid");
out.println("Journal ID:"+ jid);
%>
<br><br>
<%
String jname=(String)request.getAttribute("jname");
out.println("Journal Name:"+ jname);
%>
<br><br>
<%
String idate=(String)request.getAttribute("idate");
out.println("Journal Issue Date:"+ idate);
%>
<br><br>
<%
String rdate=(String)request.getAttribute("rdate");
out.println("Journal Return Date:"+ rdate);
%>
<br><br>
<%
int cid=(Integer)request.getAttribute("cid");
out.println("Customer ID:"+ cid);
%>
<br><br>
------------------------------------------------------------------------

<form action="index.jsp" method="get">
<input type="submit" value="logout">
</form>
</center>

</body>
</html>