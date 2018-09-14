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
	<form action = "submit.jsp" method = "GET">
		Paid To : <input type  = "text" name = "paidTo" required="required"/>
		Paid For : <input type  = "text" name = "paidFor" required="required"/>
		Paid : <input type  = "text" name = "paid" required="required"/>
		Paid Date : <input type  = "date" name = "paidDate" id = "datepicker"/>
		
		<input type = "submit" name = "submit"/>
		
	</form>
</body>
</html>