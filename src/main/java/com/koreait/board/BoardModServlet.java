package com.koreait.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mod")
public class BoardModServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		System.out.println("no : " + no);
		
		request.setAttribute("data", Database.list.get(Integer.parseInt(no)));
		
		String jsp = "/WEB-INF/jsp/mod.jsp";
		request.getRequestDispatcher(jsp).forward(request,response);
		
		
	}
	
	   			//mod.jsp에서 post로 받으라고 했기 때문에 post에서 작업
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String no = request.getParameter("no");	// array 방번호 / html에서 온 것은 parameter로 받기 !!
		String title = request.getParameter("title"); // 새로 수정된 값
		String ctnt = request.getParameter("ctnt");
		BoardVO vo = Database.list.get(Integer.parseInt(no)); //처음의 title과 ctnt를 담은 객체주소값 (Arraylist에 있는거)
		// 처음정보를 담은 BoardVO 에다가 새로 수정된 값을 담아줘야한다.
		vo.setTitle(title); //주소값 알면 어떤 명령이든 내릴 수 있음
		vo.setCtnt(ctnt);
		
		// 주소값 (디테일 화면으로)이동
		response.sendRedirect("/detail?no=" + no);
	
	}

}
