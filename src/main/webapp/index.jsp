<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 

<html> 
<head> 
<title>JDBC Connection example</title> 
</head>
<body> 
<h1>JDBC Connection example</h1> 


<form name="form1" method="POST" action="index.jsp">
   <input type="text" name="name">
   <input type="text" name="psd">
   <input type="submit" value="submit">
   <input type="reset" value="re-enter">

</form>
<p></p>
<p></p>





<% 
String db = "student_portal";
String user = "root"; // assumes database name is the same as username
String name = request.getParameter("name");
String pwd = request.getParameter("psd");

try { 
java.sql.Connection con; 
Class.forName("com.mysql.cj.jdbc.Driver"); 
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "970630"); 
//out.println (db+ "database successfully opened."); 

Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM student_portal.users;");

//out.println("hello");
while(rs.next())
//out.println("<br>" + rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3));
if(rs.getString(2).equals(name) && pwd.equals(rs.getString(3)))
{
	%>
    <script type="text/javascript">
    window.location="adMainPage.jsp";
    </script>
   <% 
}

con.close(); 
} catch(SQLException e) { 
out.println("SQLException caught: " +e.getMessage()); } 
%>



	 
</body> 
</html> 