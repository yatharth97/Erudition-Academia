<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<%
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;

		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";
		
		String c_id = session.getAttribute("courseid").toString();
		String info = request.getParameter("det").trim();
		String u1 = request.getParameter("unit1-info").trim();
		String u2 = request.getParameter("unit2-info").trim();
		String u3 = request.getParameter("unit3-info").trim();
		String u4 = request.getParameter("unit4-info").trim();
		String pass_cri = request.getParameter("pass_cri").trim();
		String lang = request.getParameter("lang").trim();
		int i=1;
		if(u1.equals(""))
			u1="null";
		if(u2.equals(""))
			u2 = "null";
		if(u3.equals(""))
		{
			u3 = "null";
		}
		if(u4.equals(""))
		{
			u4 = "null";
		}
		try{	
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			int i = st.executeUpdate("insert into course_det values('"+c_id+"','"+info+"','"+u1+"','"+u2+"','"+u3+"','"+u4+"','"+pass_cri+"','"+lang+"')");
			request.getRequestDispatcher("fac_dash.jsp").forward(request,response);		
		}catch(Exception e){
		%>
			<div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div>
		<%
			out.println(e);
		}
		finally{
			session.removeAttribute("courseid");
			try{
				st.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>
</body>
</html>