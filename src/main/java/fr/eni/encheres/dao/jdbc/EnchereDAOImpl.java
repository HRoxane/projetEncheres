/**
 * 
 */
package fr.eni.encheres.dao.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;

import fr.eni.encheres.dao.DALException;
import fr.eni.encheres.dao.EnchereDAO;

public class EnchereDAOImpl implements EnchereDAO {

	private static final String INSERT ="INSERT INTO ENCHERES(date_enchere, montant_enchere,no_article,no_utilisateur) VALUES(?,?,?,?)";

	@Override
	public void ajouterNouvelleEnchere(Integer noArticle, Integer noEncheriste, Integer montantNouvelleEnchere) throws DALException {
		Timestamp dateEnchere = Timestamp.valueOf(LocalDateTime.now());
		try(Connection cnx = JdbcTools.getConnection()) {
			PreparedStatement pStmt = cnx.prepareStatement(INSERT);
			pStmt.setTimestamp(1, dateEnchere);;
			pStmt.setInt(2, montantNouvelleEnchere);
			pStmt.setInt(3, noArticle);
			pStmt.setInt(4, noEncheriste);
			pStmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new DALException(e.getMessage());
		}
	
	}

}
