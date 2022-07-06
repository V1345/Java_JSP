<%@ page import="java.sql.*" %>

<html>
<head>
	<title> SMS App </title>
	<style>
		* {font-size:20px; font-family:Verdana; }
		.nav {background-color:black;}
		.nav a{color:white; text-decoration:none; padding:50px; }
		td {text-align: center; }
	</style>

</head>
<body>
	<center>
	<div class="nav">
		<a href="index.jsp"> Home </a>
		<a href="add.jsp"> Create </a>
	</div>
		<h1> Add Student </h1>
	<form method="POST">
		<input type="number" name="rno" placeholder="enter rno"
		required min=1 style="width:200px">
		<input type="text" name="name" placeholder="enter name"
		required style="width:200px">
		<input type="number" name="marks" placeholder="enter marks"
		required min=0 max=100 style="width:200px">
		<input type="submit" value="Save" name="btn">
	</form>
	<%
	if(request.getParameter("btn")!=null)
	{
		int rno = Integer.parseInt(request.getParameter("rno"));
		String name = request.getParameter("name");
		int marks = Integer.parseInt(request.getParameter("marks"));

	try {
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url = "jdbc:mysql://localhost:3306/kc4july22";
		String un = "root";
		String pw = "Veer@1345";
		Connection con = DriverManager.getConnection(url, un, pw);
		
		String sq = "select * from student where rno=?";
		PreparedStatement ps = con.prepareStatement(sq);
		ps.setInt(1, rno);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			out.println(rno + " already exists");
		} else {
			String sql = "insert into student values(?, ?, ?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, rno);
			pst.setString(2, name);
			pst.setInt(3, marks);
			pst.executeUpdate();
			out.println("Student added");	
		}
					
		con.close();

	} catch(SQLException e) {
		out.println("Issue " + e);
	}
}
	%>
	</center>
</body>
</html>