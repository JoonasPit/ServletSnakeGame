package DevProControl;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
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
		
		request.setAttribute("inUserName", userName);
		request.setAttribute("inColor", buttonCol);
		String jsp = "/view/secondpage.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(jsp);
		dispatcher.forward(request, response);
		
	}

}
