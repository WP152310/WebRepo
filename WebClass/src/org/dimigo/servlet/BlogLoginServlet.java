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
@WebServlet(description = "??? ???", urlPatterns = { "/bloglogin" })
public class BlogLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlogLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = request.getRequestDispatcher("myblog/index.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s, pwd: %s\n", id, pwd);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JsonObject json = new JsonObject();
		
		
		boolean result = id.equals("test@naver.com");
		// 세션에 사용자 정보를 생성
		HttpSession session = request.getSession();
		if(result){
			UserVO user = new UserVO();
			user.setId(id);
			user.setName("Freiyer");
			user.setNickname("SolMarta");
			session.setAttribute("user", user);
			json.addProperty("name", user.getName());
		}
		else {
			request.setAttribute("msg", "error");
			json.addProperty("msg", "error");
		}
		
		System.out.println(json.toString());
		out.write(json.toString());
		out.close();
	}
	
	protected void doPost2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.printf("id : %s, pwd: %s\n", id, pwd);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JsonObject json = new JsonObject();
		json.addProperty("id", id);
		out.write(json.toString());
		
		System.out.println(json.toString());
		
		out.close();
	}

}
