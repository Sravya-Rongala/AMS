<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
String id=request.getParameter("sid");
String b=request.getParameter("branch");
String n=request.getParameter("sname");
String c=request.getParameter("scontact");
String p=request.getParameter("sps");
PreparedStatement ps=con.prepareStatement("update student set sname=? , branch=?,  scontact=? , sps=?  where sid=?");
ps.setString(1,n);
ps.setString(2,b);
ps.setString(3,c);
ps.setString(4,p);
ps.setString(5,id);
int r = ps.executeUpdate();
if(r == 0)
out.println("Updation failure");
else
%>
<jsp:forward page="student.jsp"></jsp:forward>
<%
con.close();
%>