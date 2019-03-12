<%@page import="java.sql.*"%>

<html>
<body bgcolor=skyblue text=Black>
<center>
<div style="background-color:white;height:86%;width:70%;margin-left:5%">
<center>
<form>
<H2 style="color:red"><u><b><br>
<center>
REGISTRATION FORM 
</H2></u></b></center>
<HR>
<br>
<table width=600 cellspacing=10px align=center style="color:darkblue;margin-top:-3%">
<tr>
<td><font face=arial size =4>Reg. No.</td>
<td><input type=text name=txtrno size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Reg. Date</td><td><input type=txtdate size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Name</td><td><input type=text name=txtname size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Gender</td><td><input type=radio name=txtgen  checked=true >
Male &nbsp &nbsp &nbsp &nbsp <input type=radio name=txtgen>Female</td>
</tr>
<tr>
<td><font face=arial size =4>Enter Password</td><td><input type=text name=txtpass size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Confirm Password</td><td><input type=text name=txtconfirm size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Address</td><td><input type=text name=txtadd size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Contact No.</td><td><input type=contact name=txtcno  size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Email Id</td><td><input type=Email name=txteid size=30></td>
</tr>
</table>
<hr>
<center>
<input type=Submit value=SUBMIT name=b1>&nbsp;&nbsp;&nbsp;&nbsp;
<input type=Reset value=RESET name=b2>
<%
String r=request.getParameter("b1");
	if("SUBMIT".equals(r))
	{
	 int rno;
	 String rdate,name,gen,pass,confirm,address,contact,email;
	 rno=Integer.parseInt(request.getParameter("txtrno"));
	 rdate=request.getParameter("txtdate");
	 name=request.getParameter("txtname");
	 gen=request.getParameter("txtgen");
	 pass=request.getParameter("txtpass");
	 address=request.getParameter("txtadd");
	 contact=request.getParameter("txtcno");
	 email=request.getParameter("txtemail");
	 try {
	 Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nbc");
			Statement state=con.createStatement();
			String q="insert into Reg values("+rno+",'"+rdate+"','"+name+"','"+gen+"','"+address+"','"+contact+"','"+email+"','"+pass+"')";
			state.executeUpdate(q);
			out.write("<h2>Sucessfully Saved</h2>");
			}
			catch(Exception obj)
			{
			out.write(obj.getMessage());
			}
	}	
			%>
</div>
</center>
</center>
</form>
</body>
</html>


