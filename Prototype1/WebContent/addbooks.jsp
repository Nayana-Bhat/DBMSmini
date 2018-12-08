<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD BOOKS</title>
</head>
<body background="xyz.jpg">
<center><form action="Addbooks" method="post">
Enter the details of the books:

BookID: <input type="text" name="bid"><br><br>
Book Name: <input type="text" name="bname"><br><br>
Book Genre: <input type="text" name="bgenre"><br><br>
Book Rate: <input type="text" name="brate"><br><br>

AuthorID: <input type="text" name="aid"><br><br>
PublisherID: <input type="text" name="pid"><br><br>

 <input type="submit" value="add"><br><br>
 <input type="reset" value="reset"><br><br>

</form>
</center>

</body>
</html>