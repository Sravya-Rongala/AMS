<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
String id=request.getParameter("tid");
String b=request.getParameter("branch");
String s=request.getParameter("sub");
String n=request.getParameter("tname");
String c=request.getParameter("tcontact");
String p=request.getParameter("tps");
PreparedStatement ps=con.prepareStatement("update teacher set tname=? , branch=?, sub=? , tcontact=? , tps=?  where tid=?");
ps.setString(1,n);
ps.setString(2,b);
ps.setString(3,s);
ps.setString(4,c);
ps.setString(5,p);
ps.setString(6,id);
int r = ps.executeUpdate();
if(r == 0)
out.println("Updation failure");
else
%>
<jsp:forward page="teacher.jsp"></jsp:forward>
<%
con.close();
%>