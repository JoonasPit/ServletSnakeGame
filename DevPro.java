
package SnakeGameControl;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/devpro")
public class DevPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DevPro() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String jsp = "/view/projektinetusivu.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Takes user input from post for username with String Feeds to server prints on second site
		// Takes user choice and prints on second screen
		
		String userName = request.getParameter("userName");
		String buttonCol =request.getParameter("color");
		String eUserError = "";
		if (userName.equals("")) {
			String jsp = "/view/projektinetusivu.jsp";
			eUserError = "Can't be empty";
			request.setAttribute("emptyuserError", eUserError);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
			dispatcher.forward(request, response);
		}
		// doesn't work
		else if(Pattern.matches("[^\\da-zåäöA-ZÅÖÄ]",userName)) {
			String jsp = "/view/projektinetusivu.jsp";
			eUserError = "Can only contain letters, underscore or numbers";
			request.setAttribute("emptyuserError", eUserError);
			
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
		}
		String jsp = "/view/secondpage.jsp";
		request.setAttribute("inUserName", userName);
		request.setAttribute("inColor", buttonCol);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
		
	}

}
