

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Rbook
 */
@WebServlet("/Rbook")
public class Rbook extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		long days=0;
		ResultSet rs;
		String bid=request.getParameter("bid");
		String bname=request.getParameter("bname");
		//String ddate=request.getParameter("rdate");
		String cdate=request.getParameter("cdate");
		PrintWriter out=response.getWriter();
		  
		String ddate = null;
		//String cdate=null;
		long fine=0;
		try{
			//Class.forName("com.mysql.jdbc.Driver").newInstance();
			final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
					   final String DB_URL = "jdbc:mysql://localhost/prototype1";

					   //  Database credentials
					   final String USER = "root";
					   final String PASS = "root";
					   
					  
					   Connection conn = null;
					   Statement statement = null;
					   
					   
					      //STEP 2: Register JDBC driver
					      Class.forName("com.mysql.jdbc.Driver");

					      //STEP 3: Open a connection
					      System.out.println("Connecting to database...");
					      conn = DriverManager.getConnection(DB_URL,USER,PASS);


			       statement = conn.createStatement() ;
			       rs=statement.executeQuery("SELECT rdate FROM `prototype1`.`books` WHERE bid='"+bid+"'");
			       while(rs.next())
			       	 ddate=rs.getString("rdate");
			       	 //cdate=java.time.LocalDate.now().toString();
			       	 
			       	days=calcFine(ddate,cdate);
					 fine=days*2;

						request.setAttribute("bid", bid);
						request.setAttribute("bname", bname);
						request.setAttribute("rdate", ddate);
						request.setAttribute("cdate", cdate);
						request.setAttribute("fine", fine);
					
					statement.executeUpdate("UPDATE `prototype1`.`books` SET status='1' WHERE bid='"+bid+"'");
					statement.executeUpdate("UPDATE `prototype1`.`books` SET idate='"+null+"' WHERE bid='"+bid+"'");
				    statement.executeUpdate("UPDATE `prototype1`.`books` SET rdate='"+null+"' WHERE bid='"+bid+"'");
				    
					
					PrintWriter out1=response.getWriter();
					out1.println(days);
					
					getServletConfig().getServletContext().getRequestDispatcher("/returned.jsp").forward(request, response);
					
							}catch(DateTimeParseException ne) {
								out.println("INVALID INPUT."
										+ "PLEASE CHECK AND TRY AGAIN.");
							}
		catch(Exception e)
			{
			     out.println("wrong entry"+e);
			}


		
		
		
		
		
		
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	 public long calcFine(String ddate,String cdate) throws IOException {
			// public class Fine {
			   	        final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			   	       // final BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
			   	        System.out.println("Enter issue date");
			   	        final String firstInput = ddate;
			   	        System.out.println("Enter today's date");
			   	        final String secondInput = cdate;
			   	        final LocalDate firstDate = LocalDate.parse(firstInput, formatter);
			   	        final LocalDate secondDate = LocalDate.parse(secondInput, formatter);
			   	        final long days = ChronoUnit.DAYS.between(firstDate, secondDate);
			   	       // System.out.println("Days between: " + days);
			   	      /*  long fine= days-30;
			   	        if(fine>0)
			   	         System.out.println("Fine:"+ fine);
			   	        else
			   	        	System.out.println("Returned book in time");*/
			   	        return days;
			   	    }

}
