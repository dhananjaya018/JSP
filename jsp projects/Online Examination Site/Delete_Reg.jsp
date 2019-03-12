<%@page import="java.sql.*"%>
<Html>
<form>
<body bgcolor=skyblue style="margin:0">
<H2 style="color:red"><u><br>
<center>
DELETE REGISTRATION <HR>
</H2></u></b></center>
<br>
<br>
<table cellspacing=10 align=center style="color:darkblue;margin-top:-3%">
	<tr>
	<td><font face=arial size =4>Enter Registration No.</td><td><input type=text name=t1 size=30></td></tr>
	</table>
	<center>&nbsp;&nbsp;
	<input type=Submit value=VERIFY name=b1>
	</center>
	<%
	String r=request.getParameter("b1");
	if("VERIFY".equals(r))
	{
		int n=Integer.parseInt(request.getParameter("t1"));
	 try
	 {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nbc");
		Statement state=con.createStatement();
		String q="select * from reg where rno="+n+"";
		ResultSet res=state.executeQuery(q);
		if(!res.next())
			out.write("<h2> Not Found </h2>");
		else
		{
			
	%>
		<br><center>
<fieldset style="width:10%;height:70%;background-color:white;margin-top:-3;margin-left:+15">
	<table width=600 cellspacing=10px align=center style="color:darkblue;margin-top:-3%">
	<tr>
	<br>
	<td><font face=arial size =4>Reg No.</td><td><input type=text name=tt1 size=30 value=<% out.write(res.getString("Rno"));%>></td>
</tr>
<br>
<tr>
<td><font face=arial size =4>Reg Date</td><td><input type=txtdate name=txtrdate size=30  value=<% out.write(res.getString("RDate"));%>></td>
</tr>
<tr>
<td><font face=arial size =4>Name</td><td><input type=text name=txtname size=30  value=<% out.write(res.getString("Name"));%>></td>
</tr>
<tr>
<td><font face=arial size =4>Gender</td><td><input type=text name=txtgen size=30  value=<% out.write(res.getString("Gender"));%>></td>
</tr>
<tr>
<tr>
<td><font face=arial size =4>Address</td><td><input type=text name=txtadd size=30  value=<% out.write(res.getString("Address"));%>></td>
</tr>
<tr>
<td><font face=arial size =4>Contact No.</td><td><input type=text name=txtcno size=30  value=<% out.write(res.getString("Contact"));%>></td>
</tr>
<tr>
<td><font face=arial size =4>Email Id</td><td><input type=text name=txteid size=30  value=<% out.write(res.getString("Email"));%>></td>
</tr>
</table>
<hr>
<center>
<input type=hidden name=tt value=<% out.write(res.getString("rno"));%>>
<input type=Submit value=DELETE name=b2>
<%
  }
  }
      catch(Exception obj)
		{
		out.write(obj.getMessage());
		}
	 }
	 String r2=request.getParameter("b2");
	 if("DELETE".equals(r2))
	 {
	 	int n2=Integer.parseInt(request.getParameter("tt"));
        try
		{
		out.write("hello");
		  Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nbc");
			Statement state=con.createStatement();
			String q2="delete from reg where rno="+n2;
			state.executeUpdate(q2);
			out.write("<h2>Sucessfully Deleted</h2>");
			}
			catch(Exception obj)
			{
			out.write(obj.getMessage());
			}
	}	
		%>	 
</center>
</center>
</fieldset>
</div>
</center>
</center>
</form>
</body>
</html>