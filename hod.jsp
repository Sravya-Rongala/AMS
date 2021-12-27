<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>HOD</title>
<style>

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}

.topnav {
  overflow: hidden;
  background-color: #66FCF1;
  padding: 5px;
}

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #66FCF1;
  color: black;
}

.topnav a.active {
  background-color: #66FCF1;
}

.topnav .icon {
  display: none;
  font-size: 30px;
  color: #D83A56;
  padding-top: 30px;
}

@media screen and (max-width: 1580px) {
  .topnav a:not(:first-child) {display: none;}
  .topnav a.icon {
    float: right;
    display: block;
  }
}

@media screen and (max-width: 1580px) {
  .topnav.responsive {position: relative;}
  .topnav.responsive .icon {
    position: absolute;
    right: 0;
    top: 0;
  }
  .topnav.responsive a {
    float: none;
    display: block;
    text-align: left;
  }
}

.font {
  position: relative;
  text-align: center;
}

.centered {
  position: absolute;
  font-family: fantasy;
  top: 60%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 64px;
  color: whitesmoke;
  opacity: 1;
}

.below {
  position: absolute;
  font-family: fantasy;
  top: 70%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 64px;
  color: whitesmoke;
  opacity: 1;
}

.below1 {
  position: absolute;
  font-family: fantasy;
  top: 80%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 64px;
  color: whitesmoke;
  opacity: 1;
}

</style>
</head>
<body>

<div class="topnav" id="myTopnav">
  <a href="welcome.html" style="color: #D83A56; font-family: fantasy; padding: 35px 22px 0px 20px; font-size: 38px; font-weight: bolder;" >SRKR</a>

  <a href="updh.jsp" onMouseOver="this.style.color='black'" onMouseOut="this.style.color='#D83A56'" style="color: #D83A56; font-weight: bolder; font-family: cursive; font-size: 18px;">View & Update Details
  </a>

  <a href="insertt.html" onMouseOver="this.style.color='black'" onMouseOut="this.style.color='#D83A56'" style="color: #D83A56; font-weight: bolder; font-family: cursive; font-size: 18px;">Add Teachers
  </a>

  <a href="inserts.html" onMouseOver="this.style.color='black'" onMouseOut="this.style.color='#D83A56'" style="color: #D83A56; font-weight: bolder; font-family: cursive; font-size: 18px;">Add Students
  </a>

  <a href="display.jsp" onMouseOver="this.style.color='black'" onMouseOut="this.style.color='#D83A56'" style="color: #D83A56; font-weight: bolder; font-family: cursive; font-size: 18px;">View Attendance
  </a>

  <a onMouseOver="this.style.color='black'" onMouseOut="this.style.color='#D83A56'" style="color: #D83A56; font-weight: bolder; font-family: cursive; font-size: 18px;" href="welcome.html">Logout <span class="glyphicon glyphicon-log-out"></span>
  </a>

  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
    <i class="fa fa-bars"></i>
  </a>
</div>

<script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>

<div class="font centered" onMouseOver="this.style.color='#FC92E3'" onMouseOut="this.style.color='whitesmoke'">WELCOME</div>

  <%@ page import="java.io.*" %>
  <%@ page import="java.sql.*" %>
  <%
    
    Class.forName("oracle.jdbc.driver.OracleDriver"); 
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","sravya","sravya");
    String  id = (String)session.getAttribute("hd");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select hname,branch from hod where hid='"+id+"'");

    String nam = " ";
    String bran = " ";
    while(rs.next())
   {
      nam = rs.getString("hname");
      bran = rs.getString("branch");
   }

    %>
    <div class="font below" onMouseOver="this.style.color='#FC92E3'" onMouseOut="this.style.color='whitesmoke'"> <%out.println(nam);%></div>
    <div class="font below1" onMouseOver="this.style.color='#FC92E3'" onMouseOut="this.style.color='whitesmoke'">HOD - <%out.println(bran);%></div>
  <%

   con.close();
    
   %>
    


</body>
</html>
