<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%
String id=request.getParameter("username");
String p=request.getParameter("password");
Class.forName("oracle.jdbc.driver.OracleDriver"); 
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya"); 
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from hod where hid='"+id+"' and hps='"+p+"'");
             if(rs.next())
             {
       session.setAttribute("hd",id);
      %>
        <jsp:forward page="hod.jsp"></jsp:forward>
        <%}
        else
        { 
        out.println("Login Failure");
        out.println("Try Again");
        } 
con.close();
%>
