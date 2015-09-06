package com.likejian.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.likejian.thread.ChatThread;

/**
 * 
 * @author likejian
 * 
 */
@SuppressWarnings("serial")
public class ChatServlet extends HttpServlet {

	
	public void init() throws ServletException {
		super.init();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String uri = request.getRequestURI();
		if(uri.endsWith("into")){  			//进入聊天室
			intoChat(request, response);	
        }
	}
	
	private void intoChat(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		String nick = request.getParameter("nick");
		request.setAttribute("nick", nick);
		request.getSession().setAttribute("nick", nick);
		request.getRequestDispatcher("/chat.jsp").forward(request, response);
	}
}
