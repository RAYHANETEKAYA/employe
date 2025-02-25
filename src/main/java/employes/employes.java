package employes;

public class employes {
    // Attributs de la classe employes
    private int id;                // Identifiant unique de l'employé
    private String nom;            // Nom de l'employé
    private String prenom;         // Prénom de l'employé
    private String poste;          // Poste de l'employé
    private double salaire;        // Salaire de l'employé
    private String pathImage;      // Chemin de l'image de l'employé

    // Constructeur pour initialiser un objet employes
    public employes(int id, String nom, String prenom, String poste, double salaire, String pathImage) {
        this.id = id;               // Initialisation de l'ID
        this.nom = nom;             // Initialisation du nom
        this.prenom = prenom;       // Initialisation du prénom
        this.poste = poste;         // Initialisation du poste
        this.salaire = salaire;     // Initialisation du salaire
        this.pathImage = pathImage; // Initialisation du chemin de l'image
    }

    // Méthodes d'accès (getters) pour récupérer les attributs de l'employé
    public int getId() { return id; }                   // Retourne l'ID de l'employé
    public String getNom() { return nom; }               // Retourne le nom de l'employé
    public String getPrenom() { return prenom; }         // Retourne le prénom de l'employé
    public String getPoste() { return poste; }           // Retourne le poste de l'employé
    public double getSalaire() { return salaire; }       // Retourne le salaire de l'employé
    public String getPathImage() { return pathImage; }   // Retourne le chemin de l'image de l'employé
}
