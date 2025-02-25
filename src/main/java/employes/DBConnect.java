package employes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    // URL de la base de données MySQL, y compris le nom de la base de données
    private static final String URL = "jdbc:mysql://localhost:3306/entreprise";
    // Nom d'utilisateur pour se connecter à la base de données
    private static final String USER = "root";
    // Mot de passe pour se connecter à la base de données
    private static final String PASSWORD = "Secu!t3_2025";

    // Méthode statique pour obtenir une connexion à la base de données
    public static Connection getConnection() throws SQLException {
        try {
            // Chargement du pilote JDBC pour MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Retourne une nouvelle connexion à la base de données
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            // En cas d'erreur, afficher la trace de la pile
            e.printStackTrace();
            // Lancer une exception SQLException si le pilote JDBC n'est pas trouvé
            throw new SQLException("Driver JDBC non trouvé", e);
        }
    }
}
