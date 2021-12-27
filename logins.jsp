<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
String id=request.getParameter("username");
String p=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver"); 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya"); 
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from student where sid='"+id+"' and sps='"+p+"'");
             if(rs.next())
             {
          session.setAttribute("sd",id);
        %>
        <jsp:forward page="student.jsp"></jsp:forward>
        <%}
        else
        { 
        out.println("Login Failure");
        out.println("Try Again");
        } 
con.close();
%>
