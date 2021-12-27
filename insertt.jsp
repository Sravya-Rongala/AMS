<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
String id=request.getParameter("tid");
String n=request.getParameter("tname");
String b=request.getParameter("branch");
String c=request.getParameter("tcontact");
String s=request.getParameter("sub");
String p=request.getParameter("tps");
PreparedStatement ps=con.prepareStatement("insert into teacher values(?,?,?,?,?,?)");
ps.setString(1,id);
ps.setString(2,n);
ps.setString(3,b);
ps.setString(4,s);
ps.setString(5,c);
ps.setString(6,p);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
%>
<jsp:forward page="hod.jsp"></jsp:forward>
<%
con.close();
%>
