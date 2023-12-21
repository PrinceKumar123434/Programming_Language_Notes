
<%@page import="com.entities.Language"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <%@include file="all_css_js.jsp" %>
</head>
<body>

<div class="container">
<%@include file="Navbar.jsp" %><br>
<h1 style="text-transform:uppercase;">update programming language</h1><br>

<%
int langId=Integer.parseInt(request.getParameter("lang_id"));

Session s=FactoryProvider.getFactory().openSession();
Language lang=(Language)s.get(Language.class,langId);
%>


<form action="UpdateServlet" method="post">

<input value="<%=lang.getId() %>" name="langId" type="hidden">

  <div class="mb-3">
    <label for="title" class="form-label">Language title</label>
    <input required type="text" class="form-control" id="title" placeholder="Enter here" name="title" value="<%=lang.getTitle()%>">
  </div>
  
  <div class="mb-3">
    <label for="content" class="form-label">Language Content</label>
    
    <textarea required id="content" placeholder="Enter  your content here" class="form-control" style="height: 200px" name="content"><%=lang.getContent()%></textarea>
    
  </div>
  
 <div class="container text-center">  
 <button type="submit" class="btn btn-success">Save your language</button>
 </div>
</form>

</div>

</body>
</html>