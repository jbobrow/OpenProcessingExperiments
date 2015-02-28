

// ÉCRIRE UNE CLASSE ET SON CONSTRUCTEUR

void setup() {
 
 size (100,100) ;
 background(255) ;
 smooth() ;
 
 // On crée un objet, une instance, de la classe Personne et on lui donne un nom et des arguments
 Personne christophe = new Personne (int(random(255)), int(random(255)), int(random(255))) ;
 // On appelle sa méthode pour dessiner une forme
 christophe.dessiner() ;
}


class Personne {
  
 // Les variables de la classe
 color peau ;
 
 // Le constructeur de la classe
 Personne (int r, int v, int b) {
 
 // Attribution des couleurs de peau à l'aide des paramètres du constructeur
 peau = color(r, v, b) ;
   
 }
 
 void dessiner() {
 
 fill (peau) ; // Couleur de peau
 noStroke() ; // Supprimer le contour pour le visage
 ellipse(50, 50, 50, 50) ; // Tête
 fill (255) ; // Repasser en blanc pour les yeux
 stroke (255) ; // Passer en blanc pour la bouche
 line (40, 65, 60, 65) ; // Bouche
 noStroke() ; // Supprimer le contour pour les yeux
 ellipse (40, 45, 10, 10) ; // Œil gauche
 ellipse (60, 45, 10, 10) ; // Œil droit
 
 }
  
}

