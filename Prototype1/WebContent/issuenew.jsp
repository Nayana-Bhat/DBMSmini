<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<HTML>
<HEAD>
    <TITLE>Select element drop down box</TITLE>
</HEAD>

<body background="xyz.jpg">


<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
  final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		   final String DB_URL = "jdbc:mysql://localhost/prototype1";

		   //  Database credentials
		   final String USER = "root";
		   final String PASS = "root";
		   
		  
		   Connection conn = null;
		   Statement stmt = null;
		   
		   
		      //STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");

		      //STEP 3: Open a connection
		      System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);

		      
		      String uname=(String)request.getAttribute("uname");
		      String pwd=(String)request.getAttribute("pwd");
       Statement statement = conn.createStatement() ;

       resultset =statement.executeQuery("select bid,bname from prototype1.books where status=1") ;
%>


    <h5> AVAILABLE BOOKS ARE:</h5>
    <form action="Ibook" method="post">        <select>
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString("bid")%></option><option><%= resultset.getString("bname")%></option>
        <% } %>
        </select><br><br>
        
        -------------------------------------------------------------------------------<br><br>
        <br><br><br><br>
        <b>Please enter the details of the book:</b><br><br>
        	Book ID:<input type="text" name="bid"><br><br>
             Book Name: <input type="text" name="bname"><br><br>
               Issue date: <input type="text" name="idate"><br><br>
               
Enter customer ID:
<input type="text" name="cid">
 <input type="submit" value="issue" >
</form>


<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
<form action="customer.jsp" method="post">

<input type="submit" name="logout" value="logout">

</form>
</BODY>
</HTML>