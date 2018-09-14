<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>iPay</title>
</head>
<body>
	<%@ page import = "java.sql.*"  %>
	<%@ page import = "java.util.logging.*" %>
	<%@ page import = "java.util.*" %>
	<%@ page import = "java.text.*" %>
	
	<%
		String paidTo = request.getParameter("paidTo");
		String paidFor = request.getParameter("paidFor");
		Double paid = Double.valueOf(request.getParameter("paid"));
		//String paidDate = request.getParameter("paidDate");
		//DateFormat format = new SimpleDateFormat(paidDate);
		//Date pDate = format.parse(paidDate);
		
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//sdf.format(pDate);
		//Logger logger = Logger.getLogger("logger");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con ;
		
		try
		{	
			con = DriverManager.getConnection("jdbc:mysql://localhost/ipay", "root", "");
			String query = "INSERT INTO paiddata VALUES(null, ?, ?, ?, now())";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, paidTo);
			ps.setString(2, paidFor);
			ps.setDouble(3, paid);
			//ps.setString(4, paidDate);
			ps.execute(); //ps.executeUpdate();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	%>
</body>
</html>