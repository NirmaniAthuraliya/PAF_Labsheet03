<%@ page import="com.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	//Insert item----------------------------------
	if (request.getParameter("itemCode") != null)
	{
		Item itemObj = new Item();
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
		request.getParameter("itemName"),
		request.getParameter("itemPrice"),
		request.getParameter("itemDesc"));
		session.setAttribute("statusMsg", stsMsg);
	} 

	//Delete item----------------------------------
	if (request.getParameter("itemID") != null)
	{
		Item itemObj = new Item();
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		session.setAttribute("statusMsg", stsMsg);
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Item Management</title>
	<link rel="stylesheet" href="Views/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="row">
		 	<div class="col">
				<h1>Item Management</h1>
				<form method="post" action="Items.jsp">
				
					Item code : <input name="itemCode" type="text" class="form-control"><br> 
					Item name : <input name="itemName" type="text" class="form-control"><br> 
 					Item price : <input name="itemPrice" type="text" class="form-control"><br> 
 					Item description: <input name="itemDesc" type="text" class="form-control"><br>
					
					<input name="btnSubmit" class="btn btn-primary" type="submit" value="save">
				
				</form>
			</div>
		</div>
	</div>
	
	<div class="alert alert-success">
		<% out.print(session.getAttribute("statusMsg")); %>
	</div>
	
	<br>
	
	<%
		Item itemObj = new Item();
		out.print(itemObj.readItems());
	%>
	
</body>
</html>