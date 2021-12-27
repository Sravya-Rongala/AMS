<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
String id=request.getParameter("hid");
String p=request.getParameter("hps");
String c=request.getParameter("contact");
String b=request.getParameter("branch");
String n=request.getParameter("hname");
PreparedStatement ps=con.prepareStatement("insert into hod values(?,?,?,?,?)");
ps.setString(1,id);
ps.setString(2,n);
ps.setString(3,b);
ps.setString(4,c);
ps.setString(5,p);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%
con.close();
%>
