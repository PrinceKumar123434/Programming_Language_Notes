
<%@page import="com.entities.Language"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All show</title>
  <%@include file="all_css_js.jsp" %>
  
</head>
<body>

<div class="container">

<%@include file="Navbar.jsp" %>
<br>
<h1 class="text-uppercase">All languages Show: </h1>

<div class="row">
<div class="col-12">

<%
Session s=FactoryProvider.getFactory().openSession();
Query q=s.createQuery("from Language");
List<Language> list=q.list();
for(Language lang:list)
{
%>

<div class="card mt-3" style="border:5px double black;">
<!--   <img src="image/book.jpg" style="max-width:130px" class="card-img-top p-2" alt="book image"> -->
  
  
  <div class="card-body px-5">
   
   <h3 class="card-title"><%=lang.getTitle() %></h3>
    <p class="card-text"><%=lang.getContent() %></p>
  
  <p class="text-primary"><b><%=lang.getAddedDate() %></b></p>
  
  <div class="container text-center mt-1" style="position: relative; bottom: 20px">
    <a href="DeleteServlet?lang_id=<%=lang.getId() %>" class="btn btn-danger">Delete</a>
     <a href="Edit.jsp?lang_id=<%= lang.getId() %>" class="btn btn-primary">Update</a>
  </div>
  
  </div>
</div>	
	
<%
}
s.close();
%>

</div>
</div>

</div>

</body>
</html>