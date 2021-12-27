<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
String id=request.getParameter("hid");
String b=request.getParameter("branch");
String n=request.getParameter("hname");
String c=request.getParameter("contact");
String p=request.getParameter("hps");
PreparedStatement ps=con.prepareStatement("update hod set hname=? , branch=?, contact=? , hps=?  where hid=?");
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
<jsp:forward page="hod.jsp"></jsp:forward>
<%
con.close();
%>