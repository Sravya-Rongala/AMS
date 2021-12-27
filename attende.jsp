<%@ page import="java.io.*"  %>
<%@ page import="java.sql.*"  %>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");

Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");//teacher

Connection con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");//student

Connection con2=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");//attendance

String s=request.getParameter("subj");
String date=request.getParameter("dat");

String  id = (String)session.getAttribute("td"); 
   Statement st = con.createStatement();
   ResultSet rs = st.executeQuery("select branch,sub from teacher where tid='"+id+"'");

    String bran = " ";
    String subj = " ";

    while(rs.next())
   {
      bran = rs.getString("branch");
      subj = rs.getString("sub");
   }

    Statement st1 = con1.createStatement();
    ResultSet rs1 = st1.executeQuery("select count(sid) from student where branch = '"+bran+"'");
int count=0;
 if(rs1.next())
{
count = rs1.getInt(1); // teju orders.jsp
}
String[ ] attend = new String[count];

Statement st2 = con1.createStatement();
ResultSet rs2 = st2.executeQuery("select sid from student where branch = '"+bran+"'");

    int i=0;
    while(rs2.next() && i<count)
   {
     attend[i]=request.getParameter("rs2.getString(1)");
     i++;
  }

Statement st3 = con1.createStatement();
ResultSet rs3 = st3.executeQuery("select sid from student where branch = '"+bran+"'");
int j=0;

while(rs3.next() && j<count)
{
PreparedStatement ps=con2.prepareStatement("insert into attend values(?,?,?)");
ps.setString(1,rs3.getString(1));
ps.setString(2,attend[1]);
ps.setString(3,s);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
%>
<jsp:forward page="teacher.jsp"></jsp:forward>
<%
j++;
}
con.close();
%>
