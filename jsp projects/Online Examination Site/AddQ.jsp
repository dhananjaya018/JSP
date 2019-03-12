<%@page import="java.sql.*"%>

<html>
<body bgcolor=skyblue text=Black>
<form>
<center>
<div style="background-color:white;height:86%;width:70%;margin-top:40">
<center>
<table cellspacing=20px align=center style="color:darkblue;margin-top:20px">
<tr>
<td><font face=arial size =4>Question Number</td><td><input type=text name=txtqno size=30></td>
</tr>
<br>
<tr>
<td><font face=arial size =4>Question</td><td><input type=text name=txtque  size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Option 1</td><td><input type=text name=txto1 size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Option 2</td><td><input type=text name=txto2 size=30></td>
</tr>
 <tr>
<td><font face=arial size =4>Option 3</td><td><input type=text name=txtno3 size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Option 4</td><td><input type=text name=txto4 size=30></td>
</tr>
<tr>
<td><font face=arial size =4>Answer</td><td><input type=text name=txtans size=30></td>
</tr>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=Submit value=SAVE name=b1>
&nbsp;&nbsp;<input type=Reset value=RESET name=b2>
<%
String r= request.getParameter("b1");
if("SAVE".equals(r))
{
int qno;
String que,o1,o2,o3,o4,ans;
qno=Integer.parseInt(request.getParameter("txtqno"));
que=request.getParameter("txtque");
o1=request.getParameter("txto1");
o2=request.getParameter("txto2");
o3=request.getParameter("txto3");
o4=request.getParameter("txto4");
ans=request.getParameter("txtans");
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nbc");
			Statement state=con.createStatement();
			String q="insert into questions values("+qno+",'"+que+"','"+o1+"','"+o2+"','"+o3+"','"+o4+"','"+ans+"')";
			state.executeUpdate(q);
			out.write("<h2>Sucessfully Saved</h2>");
			}
			catch(Exception obj)
			{
			out.write(obj.getMessage());
			}
	}	
%>
</form>
</html>
