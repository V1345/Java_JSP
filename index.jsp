<%@ page import="java.sql.*" %>

<%
	if(request.getParameter("dr")!=null)
	{
		try {
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url = "jdbc:mysql://localhost:3306/kc4july22";
		String un = "root";
		String pw = "Veer@1345";
		Connection con = DriverManager.getConnection(url, un, pw);
		
		String sql = "delete from student where rno = ?";
		PreparedStatement pst = con.prepareStatement(sql);
	
		pst.setInt(1, Integer.parseInt(request.getParameter("dr")));
		pst.executeUpdate();
		con.close();
		} catch(SQLException e) {
		out.println("ISsue " + e);
	}
}
%>

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
		<h1> Home Page </h1>
		<table border="2" style:width:80%" >
		<tr>
			<th> Roll No </th>
			<th> Name </th>
			<th> Marks </th>
		</tr>
	<%
	try {
		DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		String url = "jdbc:mysql://localhost:3306/kc4july22";
		String un = "root";
		String pw = "Veer@1345";
		Connection con = DriverManager.getConnection(url, un, pw);
		
		String sq = "select * from student";
		PreparedStatement ps = con.prepareStatement(sq);
		ResultSet rs = ps.executeQuery();
		while(rs.next())
		{
			int rno = rs.getInt(1);
			String name = rs.getString(2);
			int marks = rs.getInt(3);

	%>	
		<tr width="50%">
			<td> <%= rno %> </td>
			<td> <%= name %> </td>
			<td> <%= marks %> </td>
<td> <a href="?dr=<%=rno %>" onclick="return confirm(' r u sure??? ')" >Delete </a> </td>
		</tr>
	<%
		}
		con.close();
	} catch(SQLException e) {
		out.println("ISsue " + e);
	}
	%>
	</table>
	</center>

</html>