package org.dimigo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dimigo.vo.UserVO;

import com.google.gson.JsonObject;
import com.google.gson.JsonPrimitive;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(description = "??? ???", urlPatterns = { "/signup" })
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("jsp/signup.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		
		System.out.printf("id : %s, pwd: %s, name: %s, nick: %s\n", id, pwd, name, nick);
		
		boolean result = true;
		if(result){
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			JsonObject json = new JsonObject();
			json.addProperty("id", id);
			out.write(json.toString());
			System.out.println(json.toString());
			out.close();
		}
		else{
			response.setContentType("application/json");
			JsonObject json = new JsonObject();
			json.addProperty("failed", "failed");
			PrintWriter out = response.getWriter();
			out.write(json.toString());
			System.out.println(json.toString());
			out.close();
		}
	}
	
	protected void doPost2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s, pwd: %s\n", id, pwd);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		/*
		 * {
		 * 		"id": testid
		 * }
		 */
		
		
//		out.println("{");
//		out.println("\"id\":\"" + id + '\"');
//		out.println("}");
		
		// JSON Simple Library
//		JSONObject json = new JSONObject();
//		json.put("id", id);
//		out.write(json.toJSONString());
		
		JsonObject json = new JsonObject();
		//json.add("id", new JsonPrimitive(id));
		json.addProperty("id", id);
		out.write(json.toString());
		
		System.out.println(json.toString());
		
		out.close();
	}

}
