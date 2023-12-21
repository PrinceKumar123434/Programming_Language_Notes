package com.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Language;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		try
		{
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int langId=Integer.parseInt(request.getParameter("langId"));
		
		Session s=FactoryProvider.getFactory().openSession();
		Transaction tx=s.beginTransaction();
		
		Language lang=s.get(Language.class,langId);
		lang.setTitle(title);
		lang.setContent(content);
		lang.setAddedDate(new Date());
		
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
