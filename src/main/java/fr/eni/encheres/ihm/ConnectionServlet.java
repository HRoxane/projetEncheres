package fr.eni.encheres.ihm;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fr.eni.encheres.bll.BLLException;
import fr.eni.encheres.bll.UtilisateurManagerImplAngélo;
import fr.eni.encheres.bo.Utilisateur;

/**
 * Servlet implementation class ConnectionServlet
 */
@WebServlet("/ConnectionServlet")
public class ConnectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnectionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("Connexion") != null) {
			String identifiant = request.getParameter("identifiant");
			String motDePasse = request.getParameter("motDePasse");
			Utilisateur saisieUtilisateur = new Utilisateur(identifiant, motDePasse);
			Utilisateur utilisateurRecuperer = new Utilisateur();
			
			try {
				utilisateurRecuperer = UtilisateurManagerImplAngélo.getInstance().ControleIdentifiantMotDePasse(saisieUtilisateur);
			} catch (BLLException e) {
				// TODO Auto-generated catch block
				e.getMessage();
				request.setAttribute("message", e.getMessage());
				e.printStackTrace();
			}
			
			request.setAttribute("message", utilisateurRecuperer);
		}
		
		request.getRequestDispatcher("WEB-INF/ConnexionPage.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
