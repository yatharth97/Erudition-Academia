<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="nav_css.css">
    <style>
    .mytable{
      width: 50%;
      margin-left: auto;
      margin-right: auto;
      font-size: 1.2em;
    }
    </style>
<title>DashBoard</title>
<body>
</head>
  <div class="container-fluid">
  	<jsp:include page="navbar_public.jsp" />
</div>
<div class="container text-center" style="font-size:1.4em;">
<%
		if(session.getAttribute("type")==null||session.getAttribute("uId")==null)
		{
			response.sendRedirect("login.jsp");
		}
		else if(session.getAttribute("type").toString().equals("faculty"))
		{
			request.getRequestDispatcher("fac_dash.jsp").forward(request,response);
		}
%>
		<h1 style="background-color:#eee">Student Dashboard</h1>
<%
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		Connection con = null;
		Statement st = null;
		Statement st1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		try{

			String uType = session.getAttribute("type").toString();
			String uId = session.getAttribute("uId").toString();

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			rs= st.executeQuery("Select sfname,slname,sdob,gender,graduate,street,city,state,country from "+uType+" where suserid='"+uId+"'");
			if(rs.next())
			{%>
				<table class="table table-bordered mytable">
        <tr><th>Parameter</th><th>Value</th></tr>
				<tr><td><strong>User Name:</strong></td><td><%=rs.getString("sfname")%> <%=rs.getString("slname")%></td></tr>
				<tr><td><strong>D.O.B. :</strong></td><td><%=rs.getString("sdob")%></td></tr>
				<tr><td><strong>Gender :</strong></td><td><%=rs.getString("gender")%></td></tr>
				<tr><td><strong>Graduate :</strong></td><td><%=rs.getString("graduate")%></td></tr>
				<tr><td><strong>Address :</strong></td><td><%=rs.getString("street")%></td></tr>
				<tr><td></td><td><%=rs.getString("city")%> <%=rs.getString("state")%></td></tr>
				<tr><td><strong>Country:</strong></td><td><%=rs.getString("country")%></td></tr>

				</table>

			<%}
			%>
			<hr>
			<%
				st1 = con.createStatement();
				rs1= st.executeQuery("Select coursename from feedback where suserid='"+uId+"'");
				if(rs1.next())
				{
			%>
				<h2 style="background-color:#eee">Feed Backs Given to</h2>
				<table class="table table-bordered mytable">
				<tr><th>Course Names</th></tr>
				<%
				do{
				%>
				<tr><td><%=rs1.getString("coursename")%></td></tr>
				<%
				}while(rs1.next());
				%>
				</table>

			<%	}
			%>
			<a href="feedback_form.jsp">Give FeedBack</a>
		<%
		}catch(Exception e){
		%>
				<tr><td><div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div></td></tr>
		<%
			out.println(e);
		}
		finally{
			try{
				session.removeAttribute("courseid");
				st.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
</table>
</div>
</body>
</html>
