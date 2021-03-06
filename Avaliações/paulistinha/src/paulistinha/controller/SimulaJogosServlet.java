package paulistinha.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import paulistinha.persistence.SimulaJogosDao;

@WebServlet("/simulaJogos")
public class SimulaJogosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			SimulaJogosDao rDao = new SimulaJogosDao();
			rDao.procGerar();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}finally {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.forward(request, response);
		}
	}
}
