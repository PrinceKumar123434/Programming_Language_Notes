package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Language;
import com.helper.FactoryProvider;

public class Save_Language_Servlet extends HttpServlet 
{

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		try
		{
		String title= request.getParameter("title");
		String content=request.getParameter("content");
		Language lang =new Language(0, title, content, new Date());

		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
	    s.save(lang);
		tx.commit();
		s.close();
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.println("<h1 style='text-align:center;'>Language is added successfully</h1>");
		
		out.println("<h1 style='text-align:center;'><a href='all_languages.jsp'>View all Languages</a></h1>");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}				
		
	}

}
