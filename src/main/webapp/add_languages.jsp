<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add notes</title>

 <%@include file="all_css_js.jsp" %> 
   
   <style>
  .top{
   border:10px double black;
   padding: 20px;
   }
   </style>
</head>
<body>

<div class="container">
<%@include file="Navbar.jsp" %>
<br>
<div class="top">
<h1 style="text-transform:uppercase;">Please fill your language detail</h1><br>


<form action="Save_Language_Servlet" method="post">
  
  <div class="mb-3 " >
    <label for="title" class="form-label"><h3>Programming language title</h3></label>
    <input required type="text" class="form-control" id="title" placeholder="Enter here language title" name="title">
  </div>
  
  <div class="mb-3">
    <label for="content" class="form-label"><h3>Programming Language Content</h3></label>
    
    <textarea required id="content" placeholder="Enter  your content here" class="form-control" style="height: 200px" name="content"> </textarea>
  </div>
  
 <div class="container text-center">  <button type="submit" class="btn btn-primary">Add language</button></div>
</form>
</div>

</div>
</body>
</html>