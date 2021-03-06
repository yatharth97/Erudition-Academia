<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="jquery-3.3.1.min.js"></script>

  <!-- Latest compiled JavaScript -->
  <script src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="nav_css.css">
  <style>
  .mytable{
    width: 50%;
    margin-left: auto;
    margin-right: auto;
    font-size: 1.2em;
    border: 0.1px;
    padding: 10px;
    //box-shadow: 3px 4px #666666;
  }
  .main_text{
    font-size: 1.4em;
  }
  .grey_color{
      background: rgb(238,238,238);
      background: rgba(238, 238, 238, .5);
    }
  body {
   background: url('my.jpg') no-repeat center center fixed;
   -webkit-background-size: cover;
   -moz-background-size: cover;
   -o-background-size: cover;
   background-size: cover;
    }
  </style>
<script>
$(document).ready(function(){
	$("option").change(function(){
		if($(this).val()=="stud_det"||$(this).val()=="faculty_det")
		{
			$("#enterid").show();
		}
		else{
			$("#enterid").hide();
		}
		});
    /*jQuery.each($(".delete"),function(){
  		$(this).on("click",function(){
  			$("#CtoDel").val($(this).parent().children(':first-child').html());
  		});
  	});*/
	});

</script>
<title>DashBoard</title>
</head>
<body>

	<jsp:include page="navbar_faculty.jsp" />

<div class="container text-center main_text grey_color" style="font-size:1.2em;">
<%
		if(session.getAttribute("type")==null||session.getAttribute("uId")==null)
		{
			response.sendRedirect("login.jsp");
		}
		else if(session.getAttribute("type").toString().equals("student"))
		{
			response.sendRedirect("stud_dash.jsp");
		}
		if(session.getAttribute("courseid")!=null)
		{
			session.removeAttribute("courseid");
		}
    if(session.getAttribute("last_date")!=null)
    {
      session.removeAttribute("last_date");
      session.removeAttribute("topic_name");
    }
%>
		<h1 style="background-color:#eee">Faculty Dashboard</h1>
    <hr>
<%
		String dbName = "modif_eru_acad";
		String user= "root";
		String pass= "root";

		Connection con = null;
		Statement st = null;
		Statement st1 = null;
		Statement st2 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;

		try{

			String uType = session.getAttribute("type").toString();
			String uId = session.getAttribute("uId").toString();


			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
			st = con.createStatement();
			st1 = con.createStatement();
			st2 = con.createStatement();

			rs= st.executeQuery("Select ffname,flname,dob,gender,graduate,street,city,state,country from "+uType+" where fuserid='"+uId+"'");
			rs1= st1.executeQuery("select * from admin where auserid='"+uId+"'");
			rs2= st2.executeQuery("select coursename,courseid from course where fuserid='"+uId+"'");

			if(rs.next())
			{%>
				<table class="table mytable">
        <tr><th>Parameter</th><th>Value</th></tr>
				<tr><td><strong>User Name:</strong></td><td><%=rs.getString("ffname")%> <%=rs.getString("flname")%></td></tr>
				<tr><td><strong>D.O.B. :</strong></td><td><%=rs.getString("dob")%></td></tr>
				<tr><td><strong>Gender :</strong></td><td><%=rs.getString("gender")%></td></tr>
				<tr><td><strong>Graduate :</strong></td><td><%=rs.getString("graduate")%></td></tr>
				<tr><td><strong>Address :</strong></td><td><%=rs.getString("street")%>, <%=rs.getString("city")%> <%=rs.getString("state")%>, <%=rs.getString("country")%></td></tr>
				</table>
				<hr>
				<%if(rs2.next()){%>
					<h2 style="background-color:#eee">Courses Added </h2>
					<table class="table table-bordered mytable">
          <tr><th>Course Id</th><th>Course Name</th><th>Operations On Course</th></tr>
					<%
					do
					{    String courseId =rs2.getString("courseid");
            %>
						<tr><td><%=courseId%></td><td><%=rs2.getString("coursename")%></td><td><div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" style="font-size:1.1em" type="button" data-toggle="dropdown">Select Operation<span class="caret"></span></button><ul style="font-size:1.1em" class="dropdown-menu"><li><a href="doubt_fac.jsp?courseId=<%=courseId%>">Answer Doubts</a></li><li><a href="file_upload.jsp?courseId=<%=courseId%>">Add File</a></li><li><a href="enter_question.jsp?courseId=<%=courseId%>">Add Quiz</a></li></ul></div></td></tr>
					<%}while(rs2.next());
				}
				%>
					</table>
          <form action="del_course.jsp" method="post">
            <input type="hidden" name="coursetodel" id="CtoDel" />
          </form>
<%				if(rs1.next())
				{%>
					<hr>
					<h2 style="background-color:#eee">Admin Options:</h2>

					<form action="admin_view.jsp" method="get">
					<select name="view_choice" style="font-size:1.2em">
						<option value="stud_det">view particular student details</option>
						<option value="faculty_det">view particular faculty details</option>
						<option value="faculties">view all faculty details</option>
						<option value="students">view all students details</option>
					</select>
					<input type="text" size="45" name="id" style="font-size:1.2em" placeholder="EnterID of faculty or student to be searched" id="enterid">
					<input type="submit" style="font-size:1.2em" value="see details">
					</form>
          <form action="announcement_ops.jsp" method="get">
          <label for="courseId" style="font-size:1.2em">View Or Add Particular Course Announcements:</label>
          <input type="text" placeholder="Enter Course Id" name="courseId" style="font-size:1.2em">
          <input type="submit" style="font-size:1.2em" value="See Announcements" />
          </form>
				<%}
			}

		}catch(Exception e){
		%>		<table class="mytable">
				<tr><td><div class="alert alert-danger">There might be a problem while connecting with the <strong>database. </strong></div></td></tr>
				</table>
		<%
			out.println(e);
		}
		finally{
			try{
				session.removeAttribute("courseid");
				st.close();
				st1.close();
				st2.close();
			}catch(Exception e){}
			try{
				con.close();
			}catch(Exception e){}
		}
%>

</div>
</body>
</html>
