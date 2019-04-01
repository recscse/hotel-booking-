<html>
        <head>
          
            
        </head>
    <body>
            <div id="header">
                    <img src="samplelogo.jpg" style="height:70px;width:100px;margin-left:10px;float:left">
                    <h1>Cab Sharing System</h1>
        
                </div>
              
        <div id="form-container" class=".container">                  
        <form action="./login.jsp" method="post">
        <table>
            <tr>
                <td class="simple-text">
                    student id
                </td>
                <td>
                        <input type="text"  class="text-box"name="stuid">
                    </td>
            </tr>
            <tr>
                    <td class="simple-text">
                        student name
                    </td>
                    <td>
                            <input type="text"  class="text-box"name="stuname">
                        </td>
                </tr>
                <tr>
                        <td class="simple-text">
                            student mobileno
                        </td>
                        <td>
                                <input type="text"  class="text-box"name="stumob">
                            </td>
             </tr>
             <tr>
                    <td class="simple-text">
                       student branch
    
                    </td>
                    <td>
                            <input type="text" name="stubranch" class="text-box" style="font-size:18px">
                        </td>
                    </tr>
                  
        </table>
        <input type="submit" value="Register" id="btn-submit" style="width:300px">
        <%@ page import="java.sql.*"%>
        <%@ page import="java.io.*" %> 
        <font size="+3" color="green"></b><br>
        <% 
        try{
       	Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Student_info", "root", "root");
        String id =request.getParameter("stuid");
        String name =request.getParameter("stuname");
        String mobileno =request.getParameter("stumob");
        String branch =request.getParameter("stubranch");
        String password =request.getParameter("stupassword");
      
        PreparedStatement ps =connection.prepareStatement("INSERT INTO stu_record(studentid,studentname,studentmobileno,studentbranch,studentpassword) VALUES('"+id+"','"+name+"','"+mobileno+"','"+branch+"','"+password+"')");
        int rs = ps.executeUpdate();
        if(rs>0){
            %>
            <font size="+2" color="green"></b>
                <%
                out.println("Registered Successfully");
                %>
               <br> <a href="#"><input type="button" value="Login Here" id="btn-submit"></a>
                <%
                }
        connection.close(); 
        }
        catch(Exception ex){
        %>
        </font>
        <font size="+3" color="red"></b>
        <%
        out.println("Error Occurred"+ex);
        }
        %>
        
    </form>
    </div>
    <footer>
            
                </footer>
    </body>
    </html>