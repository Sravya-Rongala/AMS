<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
String id=request.getParameter("aid");
String n=request.getParameter("aname");
String c=request.getParameter("acontact");
String p=request.getParameter("aps");
PreparedStatement ps=con.prepareStatement("update admin set aname=? , acontact=? , aps=?  where aid=?");
ps.setString(1,n);
ps.setString(2,c);
ps.setString(3,p);
ps.setString(4,id);
int r = ps.executeUpdate();
if(r == 0)
out.println("Updation failure");
else
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%
con.close();
%>