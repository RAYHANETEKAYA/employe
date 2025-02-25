package employes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeDAO {

    // Méthode pour récupérer tous les employés
    public List<employes> getAllEmployes() {
        // Liste pour stocker tous les employés
        List<employes> employesList = new ArrayList<>();
        // Requête SQL pour sélectionner tous les employés
        String sql = "SELECT * FROM employes";

        // Essai de connexion à la base de données et d'exécution de la requête
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            // Parcours des résultats de la requête
            while (rs.next()) {
                // Ajout de chaque employé à la liste
                employesList.add(new employes(
                        rs.getInt("id"),          // Récupération de l'ID
                        rs.getString("nom"),      // Récupération du nom
                        rs.getString("prenom"),   // Récupération du prénom
                        rs.getString("poste"),     // Récupération du poste
                        rs.getDouble("salaire"),  // Récupération du salaire
                        rs.getString("path_image") // Récupération du chemin de l'image
                ));
            }
        } catch (SQLException e) {
            // En cas d'erreur, afficher la trace de la pile
            e.printStackTrace();
        }
        // Retourne la liste des employés
        return employesList;
    }

    // Méthode pour ajouter un nouvel employé
    public void ajouterEmploye(employes emp) {
        // Requête SQL pour insérer un nouvel employé
        String sql = "INSERT INTO employes (nom, prenom, poste, salaire, path_image) VALUES (?, ?, ?, ?, ?)";
        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            // Paramétrage des valeurs à insérer
            pstmt.setString(1, emp.getNom());
            pstmt.setString(2, emp.getPrenom());
            pstmt.setString(3, emp.getPoste());
            pstmt.setDouble(4, emp.getSalaire());
            pstmt.setString(5, emp.getPathImage());
            
            // Exécution de la requête d'insertion
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // En cas d'erreur, afficher la trace de la pile
            e.printStackTrace();
        }
    }
}
