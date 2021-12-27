<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
String id=request.getParameter("aid");
String p=request.getParameter("aps");
String n=request.getParameter("aname");
String c=request.getParameter("acontact");
PreparedStatement ps=con.prepareStatement("insert into admin values(?,?,?,?)");
ps.setString(1,id);
ps.setString(2,n);
ps.setString(3,c);
ps.setString(4,p);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
{
%>
<jsp:forward page="admin.jsp"></jsp:forward>
<%
}
con.close();
%>
