<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<script src="https://use.fontawesome.com/releases/v5.13.1/js/all.js"></script>
	<title>Update Teacher</title>

 <style>
 	
  td{
   	font-family: cursive;
   	font-size: 18px;
   	color: whitesmoke;
   }

   td:hover{
   	color: #66FCF1;
   }
  
   caption{
   	padding-top: 20px;
   	top: 20%;
   	font-family: fantasy;
   	font-size: 38px;
   	color: whitesmoke;
   	font-weight: bolder;
   }

   caption:hover{
   	color: #66FCF1;
   }

  .button {
   background-color: #66FCF1;
   cursor: pointer;
   border: 2px solid black;
   color: white;
   padding: 5px 10px;
   text-align: center;
   display: inline-block;
   font-size: 14px;
   font-family: "cursive","cursive", cursive;
   border-radius: 5px;
   color: #D83A56;
 }  

 .button:hover{
 	color: black;
 }

   table, td {
    border: 1px solid black;
    padding: 6px;
}

  table {
    border-spacing: 20px;
    padding: 10px;
    top: 50%;
    left: 50%;
  }  

input{
	background: transparent;
	width: 110%;
	font-size: 1.3rem;
	font-family: cursive;
	color: white;
}

body {
  padding-top: 50px;
}

 </style>

</head>
<body style="background-color:black;">
  <center>

   <%@ page import="java.io.*"  %>
   <%@ page import="java.sql.*"  %>
   <%
   Class.forName("oracle.jdbc.driver.OracleDriver");
   Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
   String  id = (String)session.getAttribute("td");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select tid,tname,branch,sub,tcontact,tps from teacher where tid='"+id+"'");

    while(rs.next())
   {

%>

  <form name="f1" method="POST" action="tupdate.jsp">
  
  <table>
  <caption>DETAILS</caption>
  <tr>
  <td>I'D </td>
  <td><input type="text" name="tid" value="<%=rs.getString(1)%>">
  </td>
  </tr>

  <tr>
  <td>Name</td>
  <td><input type="text" name="tname" value="<%=rs.getString(2)%>">
  </td>
  </tr>

  <tr>
  <td>Branch</td>
  <td><input type="text" name="branch" value="<%=rs.getString(3)%>">
  </td>
  </tr>

  <tr>
  <td>Subject</td>
  <td><input type="text" name="sub" value="<%=rs.getString(4)%>"></td>
  </tr>

  <tr>
  <td>Contact</td>
  <td><input type="text" name="tcontact" value="<%=rs.getString(5)%>" pattern="[0-9]{10}"></td>
  </tr>

  <tr>
  <td>Password</td>
  <td><input type="text" name="tps" value="<%=rs.getString(6)%>"></td>
  </tr>

  <tr>
  <td><button type="submit" class="button">Update <i class="far fa-edit"></i></button>
  </td>
  </tr>

  <form action="teacher.jsp" method="POST">
  <tr>
  <td><button type="submit" class="button">Back <i class="fas fa-backward"></i></button>
  </td>
  </tr>
  </form>

</table>

</form>
<%
	}

	con.close();

%>

</body>
</html>