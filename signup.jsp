<%@page import="java.sql.ResultSet" %>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnsubmit")!=null){
	String name=request.getParameter("txtname");
	String email=request.getParameter("txtemail");
	String pass=request.getParameter("txtpass");
	String cpass=request.getParameter("txtcpass");
	String mobile=request.getParameter("txtmobile");
	if(pass.equals(cpass)){
		da.executeSql("insert into customer(customername,Email,Password,Mobileno) values(?,?,?,?)",name,email,pass,mobile);
		msg="Register Successfully";
	}else{
		msg="Password and Confirm Password Mismatch";
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
<body style="background-image:url('/Project/image/imgae2.jpg'); background-size:80%">


<div class="container">
<br>
<br>

<h1>signup/Registration Form:</h1>
<div class="col-6">
<form>
		<div class="form-group">
		User Name
		<input type="text" name="txtname" placeholder="Password"  class="form-control"/>
		</div>
		<div class ="form-group">
		Email ID
		<input type="Email" name="txtemail" placeholder="User Name"  class="form-control"/>
		</div>
		<div class ="form-group">
		Password
		<input type="password" name="txtpass" placeholder="Enter Password"  class="form-control"/>
		</div>
		<div class ="form-group">
		Confirm Password
		<input type="password" name="txtcpass" placeholder="Confirm Password"  class="form-control"/>
		</div>
		<div class ="form-group">
		Mobile No
		<input type="text" name="txtmobile" placeholder="Mobile No"  class="form-control"/>
		</div>
		<br>
		<div class="form-group">
		<input type="submit" name="btnsubmit"  value="Submit" class="btn btn-primary"/>
		<input type="reset" name="btnreset"  value="Reset" class="btn btn-primary"/>
		<input type="cancel" name="btncancel"  value="Cancel" class="btn btn-danger"/>
		</div>
</form>
<%=msg %>
</div>
</div>
<%@ include file="footer.jsp"%>