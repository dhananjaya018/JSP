<%@page import="java.sql.*"%>
<html>
<Body style="margin:0" Bgcolor=teal>
<center>
<form>
<br>
   <DIV style="width:48%;height:70%;Background-color:white">
      <Center>
	  <br>
	       <Font color =crimson size=5><B><U>SIGN IN</U></B></Font>
		   <br>
		   <br>
		   <img src=images/img15.jfif width=40% height=30%>
		   <p>
		   <input type=text name=t1 size=30 placeholder="NAME">
		   <p>
		   <input type=password name=t2 size=30 placeholder="PASSWORD">
		   <p>
		   <input type=Submit name=b1 Value=LOGIN>
           <p>
		   	   <%
	String r=request.getParameter("b1");
	if("Submit".equals(r))
	{
	 
		String p,n;
		n=request.getParameter("t1");
		p=request.getParameter("t2");
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","nbc");
			Statement state=con.createStatement();
			String q="select * from reg where name='"+n+"' and password='"+p+"'";
			ResultSet res=state.executeQuery(q);
			if(!res.next())
			out.write("<h2> Incorrect Password </h2>");
			else
			{
				%>
					<jsp:forward page="exam.jsp" />
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
</center>
</DIV>