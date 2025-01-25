<%@page import="com.util.db.DataAccess1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Furniture Shop</title>
<link href="/Project/css/bootstrap.css" rel="stylesheet"/>
<link href="/Project/css/DataTables/datatables.css" rel="stylesheet"/>
<%
    DataAccess1 da=new DataAccess1();
   String msg="",search="";
if(request.getParameter("btnsearch")!=null){
	search=request.getParameter("txtsearch");
	session.setAttribute("search",search);
	response.sendRedirect("/Project/customer/product.jsp?q="+search);
}
%>
 </head> 

<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
  <div class="container-fluid">
  <img alt="image" src="/Project/image/imgg.jpg" height="80px" width="90px"/>
    <a class="navbar-brand text-white" href="#"><h4>Furniture Shop</h4></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <%
      if(session.getAttribute("user")==null){
      %>
        <li class="nav-item">
          <a class="nav-link active text-white" href="#">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="signin.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="signup.jsp">signup</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link text-white" href="about.jsp">About</a>
        </li>
        <%
      }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
        %>
        <li class="nav-item">
          <a class="nav-link active text-white" href="#">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="category.jsp">Category</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="brand.jsp">Brand</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Project/admin/customerlist.jsp">customerlist</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Project/admin/productlist.jsp">Product</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link text-white" href="signin.jsp"><%=session.getAttribute("user") %>></a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Project/admin/reportlist.jsp">Reports</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link text-white" href="/Project/admin/changepass.jsp">Change Password</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Project/admin/logout.jsp">Logout</a>
        </li>
       	<%
      }else {
       	%>
       	<li class="nav-item">
          <a class="nav-link active text-white" href="#">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        
         <li class="nav-item">
          <a class="nav-link text-white" href="/Project/admin/product.jsp">Product</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="#"><%=session.getAttribute("user") %>></a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Project/customer/order.jsp">Order</a>
          <li class="nav-item">
          <a class="nav-link text-white" href="/Project/customer/feedback.jsp">Feedback</a>
        </li>
       <li class="nav-item">
          <a class="nav-link text-white" href="/Project/customer/changepass.jsp">Change Password</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/Project/customer/logout.jsp">Logout</a>
        </li>
       </ul>
        <%
      if(session.getAttribute("type").equals("customer")){
      %>
      <form class="d-flex">
        <input class="form-control me-sm-2" type="search" name="txtsearch" placeholder="Product Name">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit" name="btnsearch" value="Search">Search</button>
      </form>
      <%
      }
      %>
      <%
       }
       %>
    
      <form class="d-flex">
        <input class="form-control me-sm-2" type="search" placeholder="Search">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>