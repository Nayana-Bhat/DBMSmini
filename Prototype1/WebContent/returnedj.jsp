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
Journal returned successfully.<br><br>
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
String rdate=(String)request.getAttribute("rdate");
out.println("Journal Due Date:"+ rdate);
%>
<br><br>
<%
String cdate=(String)request.getAttribute("cdate");
out.println("Journal Return Date:"+ cdate);
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