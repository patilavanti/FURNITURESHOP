<%@page import="java.sql.ResultSet" %>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnlogin")!=null){
	String user=request.getParameter("txtuser");
	String pass=request.getParameter("txtpass");
	if(user.contains("admin")){
	ResultSet rs=da.getRows("select * from adminlogin where username=? and password=?",user,pass);
	if(rs.next()){
	msg="Login Successful";
	session.setAttribute("user",user);
	session.setAttribute("pass",pass);
	session.setAttribute("type", "admin");
	response.sendRedirect("/Project/admin/admin.jsp");
	}else{
		msg="Invalid Username and Password";
		session.setAttribute("user",null);
		session.setAttribute("pass",null);
		session.setAttribute("type",null);
	}
	}else{
		ResultSet rs=da.getRows("select * from customer where email=? and password=?", user,pass);
		if(rs.next()){
				msg="Login Successful";
				session.setAttribute("user",user);
				session.setAttribute("pass",pass);
				session.setAttribute("type", "customer");
				response.sendRedirect("/Project/customer/customer.jsp");
				}else{
					msg="Invalid Username and Password";
					session.setAttribute("user",null);
					session.setAttribute("pass",null);
					session.setAttribute("type",null);
				}
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/Project/css/bootstrap.css" rel="stylesheet"/>
<link href="/Project/js/datatables.css" rel="stylesheet"/>
</head>
<body style="background-image:url('/Project/image/image1.jpg'); background-size:90%">

<div class="container">
<br>
<br>
<h4>Login form:</h4>
<div class="col-6">
<form>
		<div class="form-group">
		UserName/Email ID
		<input type="text" name="txtuser" placeholder="User Name"  class="form-control"/>
		</div>
		<div class ="form-group">
		Password
		<input type="password" name="txtpass" placeholder="Password"  class="form-control"/>
		</div>
		<br>
		<div class="form-group">
		<input type="submit" name="btnlogin"  value="Login" class="btn btn-primary"/>
		<input type="reset" name="btnreset"  value="Reset" class="btn btn-primary"/>
		<input type="cancel" name="btncancel"  value="Cancel" class="btn btn-danger"/>
		</div>
</form>
<%=msg %>
</div>
</div>

<%@ include file="footer.jsp"%>
