<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<html>
<head>
<title>Insert title here</title>
<style>
.aDivS{margin-left:40px;border:0px;width:280px;height:100px;}
</style>
</head>
<body>
<h1>Add Student</h1>

<form name ="form2.1" method = "post" action = "addStudent.jsp">
<div class="aDivS">
<p style = "float:left;">userName:  </p>
<input type="search" name = "userName"/>
</div>
<div class="aDivS">
<p style = "float:left;">password:  </p>
<input type="search" name = "psd"/>
</div>

<div class="aDivS">
<p style = "float:left;">first name:  </p>
<input type="search" name = "f_name"/>
</div>

<div class="aDivS">
<p style = "float:left;">last name: </p>
<input type="search" name = "l_name"/>
</div>

<div class="aDivS">
<p style = "float:left;">email:  </p>
<input type="search" name = "email"/>
</div>

<div class="aDivS">
<p style = "float:left;">phone</p>
<input type="search" name = "number"/>
</div>

<input type="submit" value = "add Student" style="height = 30px, width = 50px">
</form>

<%
String db = "student_portal";
String user = "root"; // assumes database name is the same as username

String name = request.getParameter("userName");
String pwd = request.getParameter("psd");
String f_name = request.getParameter("f_name");
String l_name = request.getParameter("l_name");
String email = request.getParameter("email");
String number = request.getParameter("number");


try { 
java.sql.Connection con; 
Class.forName("com.mysql.cj.jdbc.Driver"); 
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, "root", "970630"); 


Statement stmt=con.createStatement();
if(name!=null)
{
ResultSet rs=stmt.executeQuery("SELECT count(user_id) FROM student_portal.users;");
rs.next();
// check the id
int current_id = rs.getInt(1)+1;
String sqlInfo = "INSERT INTO `student_portal`.`users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`, `phone`) VALUES ('3', 'alio', '123456', 'alio', 'what', 'alioWhat@sjsu.edu', '4010010001');";
//String info = "INSERT INTO `student_portal`.`users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`, `phone`) VALUES ("+

int flag = stmt.executeUpdate("INSERT INTO `student_portal`.`users` (`user_id`, `username`, `password`, `first_name`, `last_name`, `email`, `phone`)"
+ "VALUES('"+String.valueOf(current_id)+"','"+name+"'"	+",'"+pwd+"','"+f_name+"','"+l_name+"','"+email+"','"+number+"');"
		);
//int i = stmt.executeUpdate(sqlInfo);

//addRs.next();

//+"VALUES (" '3', 'roman', '1', 'roman', 'dropped', 'droped.roman.sjsu,edu', '6107980201')";); 


}
else
{
out.println("erro");
con.close(); 
}
} catch(SQLException e) { 
out.println("SQLException caught: " +e.getMessage()); } 

%>


</body>
</html>