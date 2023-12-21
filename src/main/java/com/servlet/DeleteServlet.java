package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Language;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet 
{
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
response.setContentType("text/html");
		
		try
		{
		int langId=Integer.parseInt(request.getParameter("lang_id").trim());	
		
		Session s=FactoryProvider.getFactory().openSession();
	    Transaction tx=s.beginTransaction();
		Language lang=(Language)s.get(Language.class,langId);
		s.delete(lang);
		tx.commit();
		s.close();
		
		response.sendRedirect("all_languages.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		
	}

}
