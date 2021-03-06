

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Clogin")
public class Clogin extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int cid=-1;
		String uname=request.getParameter("uname");
		String pwd=request.getParameter("pwd");
		String value=request.getParameter("submit");
		if(value.equals("login")) {

		if(validate(uname,pwd)) {
			try {
			request.setAttribute("pwd", pwd);
			request.setAttribute("uname", uname);
			cid=getCid(uname,pwd);
			System.out.println(uname);
			System.out.println(cid);
			request.setAttribute("cid", cid);

				getServletConfig().getServletContext().getRequestDispatcher("/successlogc.jsp").forward(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			}
		else {
							response.sendRedirect("err.jsp");
			}
		}
		else {
			response.sendRedirect("default.jsp");
		}
			
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	public boolean validate(String uname,String pwd) {
		

		boolean flag=false;
		// JDBC driver name and database URL
		   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		   final String DB_URL = "jdbc:mysql://localhost/Prototype1";

		   //  Database credentials
		   final String USER = "root";
		   final String PASS = "root";
		   
		  
		   Connection conn = null;
		   Statement stmt = null;
		   
		   try{
		      //STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");

		      //STEP 3: Open a connection
		      System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);

		      //STEP 4: Execute a query
		      System.out.println("Creating statement...");
		      stmt = conn.createStatement();
		      
		     
		      //stmt.executeUpdate("INSERT INTO usertable(userid,name,username,password)"+"values('"+usr.getUserid()+"','"+usr.getName()+"','"+usr.getUsername()+"','"+usr.getPassword()+"')");
		     // stmt.executeUpdate("INSERT INTO usertable(name,username,password)"+"values('"+usr.getName()+"','"+usr.getUsername()+"','"+usr.getPassword()+"')");
		    String type="C";
		      ResultSet rs=stmt.executeQuery("SELECT * FROM customer WHERE username='"+uname+"' AND password='"+pwd+"'");
		      if(rs.next()) {
		    	  flag=true;
		      }
		      else {
		    	  flag=false;
		      }

		      
		   
		      System.out.println("Success");
		      stmt.close();
		      conn.close();
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		      return false;
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		      }// nothing we can do
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try
		   System.out.println("\nGoodbye!");
		   return flag;
		

	}
	public int getCid(String uname,String pwd) {
		int cid=-1;
		// JDBC driver name and database URL
		   final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		   final String DB_URL = "jdbc:mysql://localhost/Prototype1";

		   //  Database credentials
		   final String USER = "root";
		   final String PASS = "root";
		   
		  
		   Connection conn = null;
		   Statement stmt = null;
		   
		   try{
		      //STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");

		      //STEP 3: Open a connection
		      System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);

		      //STEP 4: Execute a query
		      System.out.println("Creating statement...");
		      stmt = conn.createStatement();
		      
	      ResultSet rs=stmt.executeQuery("SELECT cid FROM customer WHERE username='"+uname+"' AND password='"+pwd+"'");
		      if(rs.next()) {
		    	  cid=rs.getInt("cid");
		      }
		     
		      
		   
		      System.out.println("Success");
		   
		      stmt.close();
		      conn.close();
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		      }// nothing we can do
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try
		   System.out.println("\nGoodbye!");
		   return cid;
		
	}

}
