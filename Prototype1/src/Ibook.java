
import  java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.text.ParseException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.awt.RepaintArea;


/**
 * Servlet implementation class Ibook
 */
@WebServlet("/Ibook")
public class Ibook extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath()).append("\n");
		PrintWriter out=response.getWriter();
		String rdate="";
		String bid=request.getParameter("bid");
		String bname=request.getParameter("bname");
		String idate=request.getParameter("idate");
		String scid=request.getParameter("cid");
		int cid=Integer.parseInt(scid);
		
		out.println("\nBook issued successfully.");
		out.println("Book ID : "+bid);
		out.println("Book name : "+bname);
		out.println("Book issue date : "+idate);
		out.println("Customer ID : "+cid);

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
		       
			
		       rdate=setReturnDate(idate);
		       Date idate1=new SimpleDateFormat("dd-MM-yyyy").parse(idate);
		       Date rdate1=new SimpleDateFormat("dd-MM-yyyy").parse(rdate);
		       System.out.print(idate);
		       System.out.print(rdate);
	           out.println("Book return date : "+rdate);
				
 
				//statement = conn.prepareStatement("UPDATE prototype1.books SET status='0' where bid='"+bid+"'");
				statement.executeUpdate("UPDATE `prototype1`.`books` SET status='0' WHERE bid='"+bid+"'");
			       System.out.print("0");
				//statement = conn.prepareStatement("UPDATE prototype1.books SET idate='"+idate+"' where bid='"+bid+"'");
				statement.executeUpdate("UPDATE `prototype1`.`books` SET idate='"+idate+"' WHERE bid='"+bid+"'");
			       System.out.print(idate1);
				//statement = conn.prepareStatement("UPDATE prototype1.books SET rdate='"+rdate+"' where bid='"+bid+"'");
				statement.executeUpdate("UPDATE `prototype1`.`books` SET rdate='"+rdate+"' WHERE bid='"+bid+"'");
			       System.out.print(rdate1);
			       statement.executeUpdate("INSERT INTO `prototype1`.`borrow`(bid,cid)"+"values('"+bid+"','"+cid+"')");
			       System.out.print(cid);
						}
		catch(Exception e)
		{
		     out.println("wrong entry"+e);
		}

		request.setAttribute("bid", bid);
		request.setAttribute("bname", bname);
		request.setAttribute("idate", idate);
		request.setAttribute("rdate", rdate);
		request.setAttribute("cid", cid);
		getServletConfig().getServletContext().getRequestDispatcher("/issued.jsp").forward(request, response);
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

	public String setReturnDate(String idate) {
		SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
		Calendar c=Calendar.getInstance();
		try {
			c.setTime(sdf.parse(idate));
		}catch(ParseException e) {
			e.printStackTrace();
		}
		c.add(Calendar.DAY_OF_MONTH, 7);
		String rdate=sdf.format(c.getTime());
		
		return rdate;
		
	}

}
