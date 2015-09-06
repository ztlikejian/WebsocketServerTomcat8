package com.likejian.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import com.likejian.thread.ChatThread;
import com.likejian.thread.SendPingThread;

/**初始化Servlet
 * @author likejian
 */
public class InitServlet extends HttpServlet {
	
	
	public InitServlet() {
		super();
	}

	
	public void init() throws ServletException {
		ChatThread chatThread = new ChatThread();
		chatThread.setDaemon(true);
		chatThread.start();
		
		new SendPingThread().start();
	}

	@Override
	public void destroy() {
		super.destroy();
	}

}
