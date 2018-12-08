<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee summary</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="js/jspdf.js"></script>
    <script type="text/javascript" src="js/from_html.js"></script>
    <script type="text/javascript" src="js/split_text_to_size.js"></script>
    <script type="text/javascript" src="js/standard_fonts_metrics.js"></script>
    <script type="text/javascript" src="js/cell.js"></script>
    <script type="text/javascript" src="js/FileSaver.js"></script>


    <script type="text/javascript">
        $(document).ready(function() {

            $("#exportpdf").click(function() {
                var pdf = new jsPDF('p', 'pt', 'a2');
                
                // source can be HTML-formatted string, or a reference
                // to an actual DOM element from which the text will be scraped.
                source = $('#yourTableIdName')[0];

                // we support special element handlers. Register them with jQuery-style 
                // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
                // There is no support for any other type of selectors 
                // (class, of compound) at this time.
                specialElementHandlers = {
                    // element with id of "bypass" - jQuery style selector
                    '#bypassme' : function(element, renderer) {
                        // true = "handled elsewhere, bypass text extraction"
                        return true
                    }
                };
                margins = {
                    top : 80,
                    bottom : 60,
                    left : 100,
                 	width:700,
                    
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(source, // HTML string or DOM elem ref.
                margins.left, // x coord
                margins.top, { // y coord
                    'width' : margins.width, // max width of content on PDF
                    'elementHandlers' : specialElementHandlers
                },

                function(dispose) {
                    // dispose: object with X, Y of the last line add to the PDF 
                    //          this allow the insertion of new lines after html
                    pdf.save('Book Report.pdf');
                }, margins);
            });

        });
    </script>

<style>
body, html {
    height: 100%;
    margin: 0;
}

.bg {
    /* The image used */
    background-image: url("projplainbg.jpg");

    /* Full height */
    height: 100%; 

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
     border: 2px solid black;
}
table, th, td {
    border: 2px solid black;
    border-collapse: collapse;
}
th, td {
    padding: 15px;
}
table {
    border-spacing: 15px;
}
form {
    width: 180px;
    margin: 0 auto;
}
</style>
</head>
<body background="xyz.jpg">

<div id="yourTableIdName">
<div class="bg">
<%
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

   //STEP 4: Execute a query
   
  try(
    CallableStatement statement = conn.prepareCall("{call bookssummary()}");
    )
 {
    boolean hadResults = statement.execute();
 %>

 <h1 style="font-size:4vw" align="center">Summary of books</h1>

<table align="center">
<thead>
	<tr>
		<th>Book id</th>
		<th>Book name</th>
		<th>Book genre</th>
		<th>Book rate</th>
		<th>Book status</th>
		
 	</tr>
 	</thead>
<% 
    while (hadResults) {
        ResultSet resultSet = statement.getResultSet();
        
        // process result set
        while (resultSet.next()) {
        	
            String id = resultSet.getString("bid");
            String name = resultSet.getString("bname");
            String genre = resultSet.getString("bgenre");
            String price = resultSet.getString("brate");
            Boolean status = resultSet.getBoolean("status");
            %>
      <tbody>
      <tr>
      <td align="center"><%= id%></td>
      <td align="center"><%= name %></td>
      <td align="center"><%= genre%></td>
      <td align="center"><%= price%></td>
      <td align="center"><%= status %></td>
      </tr>
      
      <%          
        }
        hadResults = statement.getMoreResults();
    }
%>
		</tbody>
	</table>
	<br><br>
<p align="center" ><b>Note: </b>Please save the pdf after it opens in order to download it into the system.</p>
<%
    statement.close();

} catch (SQLException ex) {
    ex.printStackTrace();
}
%>
<br><br>
<center>
        <input type="button" id="exportpdf" value="Download PDF" style="height:30px; width:150px">

<br><br>
<form action="stats.jsp" >
<input type="submit" value="Back" style="height:35px; width:150px" >
</form>
<br>
<form action="employee.jsp" >
<input type="submit" value="Logout" style="height:35px; width:150px" >
</form>
<br><br>
</center>
</div>
</div>
</body>
</html>