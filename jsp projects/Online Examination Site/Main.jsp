<%@page import="java.sql.*"%>

<html>
<body>
<form>
	<fieldset style="width:43%;height:83%;background-color:none;float:left;border:none;margin-left:-5">
		<img src="images/img18.jpg" width=680px height=550px>
	</fieldset> 
		<fieldset style="width:27%;height:83%;background-color:#aacff9;float:left;border:none;margin-left:0;margin-top:+5">
		<font face="arial black" size=5 color=blue>
		<center>
			Exam Tips
		</center>
<marquee direction=up height=86%>
<ul type=CIRCLE>
<li>test</li>
<li>test2</li>
<li>test</li>
<li>test2</li>
<li>test</li>
<li>test2</li>
</ul>
</marquee>
</font>
</fieldset>
<fieldset style="width:10%;height:83%;background-color:skyblue;float:left;border:none;margin-top:5;margin-left:13">
<font face="arial black" size=4 color=Red>
<center><br>
ADIMINISTRATOR
</center>
 <img src="B.jpg" width=95% height=30%>
	<table cellspacing=10>
	<tr>
	<td>Name</td><td><input type=text name=txtname></td>
	</tr>
	<tr>
	<td>Password</td><td><input type=text name=txtpass></td>
	</tr>
	</table>
	<center>
		<input type=submit value="Submit" name=b2>
	</fieldset>
	<center>
	<tr>
	</fieldset>

<%
	String r=request.getParameter("b2");
	if("Submit".equals(r))
	{
	 
		String p,n;
		n=request.getParameter("txtname");
		p=request.getParameter("txtpass");
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nbc");
			Statement state=con.createStatement();
			String q="select * from admin where name='"+n+"' and password='"+p+"'";
			ResultSet res=state.executeQuery(q);
			if(!res.next())
			out.write("<h2> Incorrect Password </h2>");
			else
			{
				%>
					<jsp:forward page="admin.jsp" />
				<%
			}
			}
			catch(Exception obj)
			{
				out.write(obj.getMessage());
			}
	}
%>	
</form>
</body>
</html>