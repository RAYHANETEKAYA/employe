<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="employes.EmployeDAO, employes.employes" %>
<%@ page import="java.io.*, javax.servlet.http.Part" %>
<html>
<head>
    <title>Ajouter un Employé</title>
</head>
<body>
    <h1>Ajouter un Employé</h1>
    <form action="ajouterEmploye.jsp" method="post" enctype="multipart/form-data">
        <!-- Champ pour le nom de l'employé -->
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" required><br><br>
        
        <!-- Champ pour le prénom de l'employé -->
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" required><br><br>
        
        <!-- Champ pour le poste de l'employé -->
        <label for="poste">Poste:</label>
        <input type="text" id="poste" name="poste" required><br><br>
        
        <!-- Champ pour le salaire de l'employé -->
        <label for="salaire">Salaire:</label>
        <input type="number" id="salaire" name="salaire" step="0.01" required><br><br>
        
        <!-- Champ pour télécharger l'image de l'employé -->
        <label for="image">Image:</label>
        <input type="file" id="image" name="image" accept="images/*" required><br><br>
        
        <!-- Bouton pour soumettre le formulaire -->
        <input type="submit" value="Ajouter">
    </form>
    <a href="employes.jsp">Retour à la liste des employés</a>

    <%
        // Vérifier si le formulaire a été soumis en récupérant les paramètres
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String poste = request.getParameter("poste");
        String salaireStr = request.getParameter("salaire");

        // Si tous les champs sont remplis
        if (nom != null && prenom != null && poste != null && salaireStr != null) {
            // Conversion du salaire de String à double
            double salaire = Double.parseDouble(salaireStr);

            // Gérer l'upload de l'image
            Part filePart = request.getPart("image"); // Récupérer le fichier téléchargé
            String fileName = filePart.getSubmittedFileName(); // Nom du fichier
            // Déterminer le chemin d'upload pour enregistrer l'image
            String uploadPath = application.getRealPath("") + "images" + File.separator + fileName;
            File uploadDir = new File(application.getRealPath("") + "images"); // Répertoire de destination
            if (!uploadDir.exists()) {
                uploadDir.mkdir(); // Créer le répertoire s'il n'existe pas
            }
            // Écrire le fichier téléchargé dans le répertoire
            filePart.write(uploadPath);
            
            // Stocker le chemin de l’image dans la base de données
            String pathImage = "images/" + fileName; // Chemin relatif de l'image

            // Ajouter l'employé dans la base de données via EmployeDAO
            EmployeDAO employeDAO = new EmployeDAO();
            employeDAO.ajouterEmploye(new employes(0, nom, prenom, poste, salaire, pathImage)); // ID géré par la BD

            // Afficher un message de succès
            out.println("<h2>Employé ajouté avec succès!</h2>");
        }
    %>
</body>
</html>
