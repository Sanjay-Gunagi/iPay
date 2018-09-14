<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>iPay</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>

</head>
<body>
	<%@ page import = "java.sql.*" %>'
	<%@ page import = "java.text.*" %>
	<%@ page import = "java.util.*" %>
	
	<form action="search.jsp" method="get">
	
	<!-- Paid Date : <input type  = "text" name = "selectDate" id = "datepicker" onchange="this.form.submit();"/> -->
	
	<select name = "dateSelected" onchange="this.form.submit();">
		<option value = "0"> Select </option>
		<%
		try
		{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/ipay", "root", "");
			//String query = "SELECT * FROM paiddata WHERE paiddate = ?";
			Statement st = con.createStatement();
			
			ResultSet rs = st.executeQuery("SELECT DISTINCT paiddate FROM paiddata");
		/* 	if(rs.next() == false)
			{
				out.print("null");
			}
			else
			{
				out.print("OK");
			} */
				
			while(rs.next())
			{
				//System.out.println("Hello");	
		%>
			<option value = "<%=rs.getString("paiddate")%>"> <%=rs.getString("paiddate")%> </option>
			<% 				
			}
		}
		catch(Exception e)
		{
					
		}
		%>
	</select>
	
	<table border = "1">
		<tr>
			<th>Paid To</th>
			<th>Paid For</th>
			<th>Paid</th>
			<th>Paid Date</th>
		</tr>
		<%
		try
		{
			/* String d = request.getParameter("selectDate");
			String[] d1 = new String[10];
			d1 = d.split("%2F");
			
			
			DateFormat format = new SimpleDateFormat();
			Date date1 = format.parse(d);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			sdf.format(date1);
			
			String s1 = String.valueOf(date1);
			System.out.println(s1); */
			
			
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/ipay", "root", "");
			//String query = "SELECT * FROM paiddata WHERE paiddate = ?";
			//Statement st = con.createStatement();
			
			PreparedStatement ps = con1.prepareStatement("SELECT * FROM paiddata WHERE paiddate=?");
			ps.setString(1, request.getParameter("dateSelected"));
			ResultSet rs1 = ps.executeQuery();
			double sum = 0;
			//ResultSet rs = st.executeQuery("SELECT * FROM paiddata WHERE paiddate="+request.getParameter("dateSelected"));
			if(rs1.next() == false)
			{
				out.print("null1");
			}
			else
			{
				//out.print("OK1");
			}
			while(rs1.next())
			{
				//out.println("HI");
		%>
			<tr>
				<td><%=rs1.getString("paidto") %></td>	
				<td><%=rs1.getString("paidfor") %></td>	
				<td><%=rs1.getDouble("paid") %></td>	
				<td><%=rs1.getDate("paiddate") %></td>	
			</tr>
		<% 	
				sum = sum + rs1.getDouble("paid");
			}
			out.println("Total : "+sum);
		}
		catch(Exception e)
		{
			
		}
		%>
	</table>
	</form>
</body>
</html>