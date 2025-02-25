-- Création de la base de données
CREATE DATABASE IF NOT EXISTS entreprise;
USE entreprise;

-- Création de la table employés avec le champ path_image
CREATE TABLE IF NOT EXISTS employes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    poste VARCHAR(100) NOT NULL,
    salaire DECIMAL(10,2) NOT NULL,
    path_image VARCHAR(255) -- Nouveau champ pour le chemin de l'image
);

-- Insertion de données avec le chemin de l'image
INSERT INTO employes (nom, prenom, poste, salaire, path_image) VALUES 
('Dupont', 'Jean', 'Développeur', 3500.00, 'static/images/dupont_jean.jpg'),
('Martin', 'Sophie', 'Chef de projet', 5000.00, 'static/images/martin_sophie.jpg'),
('Lemoine', 'Paul', 'Administrateur Systèmes', 4200.00, 'static/images/lemoine_paul.jpg'),
