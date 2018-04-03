<%@page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <title>File Upload</title>
</head>
<body>
<div class="container">
	<jsp:include page="navbar_faculty.jsp" />
    <%

	if(session.getAttribute("type")==null||session.getAttribute("uId")==null)
	{
		response.sendRedirect("login.jsp");
	}
	else if(session.getAttribute("type").toString().equals("student"))
	{
		response.sendRedirect("stud_dash.jsp");
	}
	String dbName = "modif_eru_acad";
	String user= "root";
	String pass= "root";

	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	String unitName = session.getAttribute("unit").toString();
	String c_id = session.getAttribute("courseid").toString();
	String path = session.getAttribute("fPath").toString();
	String fName = session.getAttribute("fName").toString();
  String fType = session.getAttribute("fType").toString();
  String fTitle = session.getAttribute("fTitle").toString();

	if(unitName==null|| c_id==null||path==null||fName==null||fType==null||fTitle==null)
		response.sendRedirect("error.jsp");

	String sendpage="";//set the page where the control will be transferred to.

	//Now Inserting data into the content table
	try{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dbName,user,pass);
		st = con.createStatement();
		int i = st.executeUpdate("insert into content(courseid,unitname,path,filename,filetype,filetitle) values('"+c_id+"','"+unitName+"','"+path+"','"+fName+"','"+fType+"','"+fTitle+"')");
		sendpage="file_upload.jsp";
		session.removeAttribute("fPath");
		session.removeAttribute("unit");
		session.removeAttribute("fName");
    session.removeAttribute("fType");
    session.removeAttribute("fTitle");
	}//end of try

	catch(Exception e){sendpage="error.jsp";}
	finally{
		try{
			st.close();
		}catch(Exception e){e.printStackTrace();}
		try{
			con.close();
		}catch(Exception e){e.printStackTrace();}
	}//end of finally
	response.sendRedirect(sendpage);
  %>
</div>
</body>
</html>
