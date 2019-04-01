<html>
        <head>
            <title>Admin Login Section</title>
            <link rel="stylesheet" href="style.css">
        </head>
        <body>
                <div id="header">
                 
                </div>
               
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<% 
try{
	Class.forName("com.mysql.jdbc.Driver");
String connectionURL = "jdbc:mysql://localhost:3306/customer_info"; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
Connection connection = DriverManager.getConnection(connectionURL, "root", "12345");
String mobile =request.getParameter("mobno");
String password =request.getParameter("pswrd");
session.setAttribute("mobile",mobile);

PreparedStatement ps =connection.prepareStatement("select studentname,studentmobileno,studentpassword from customer_detail where studentmobileno='"+ mobile+ "' AND studentpassword='"+ password+"'");
ResultSet rs = ps.executeQuery();
if(rs.next())    
%>
<font size="+2" color="green">
<%    
session.setAttribute("studentname",rs.getString("studentname"));
response.sendRedirect("CustomerDashboard.jsp");
connection.close();
}
catch(Exception ex){
%>
</font>
<font size="+3" color="red"></b>
<%
out.println("Error Occurred :"+ex);
//out.println(ex.printStackTrace());
}
%>
</font>
</body>
</html>