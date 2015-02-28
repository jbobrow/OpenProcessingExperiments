

// Import de la librairie video - Présenter la doc
import processing.video.* ;

// Déclaration d'un objet Movie
Movie monFilm ;

// Variables pour les calculs de trigonométrie
int x ;
int y ;
int rayon = 200 ;
float angle = 0 ;

void setup() {
 
  size (600,600,P2D);
  
  // Chargement de la video dans l'objet déclaré plus haut
  monFilm = new Movie (this, "station.mov");
  
  // Commande de boucle
  monFilm.loop() ;
  
  // Lecture lancée à l'ouverture
  monFilm.play() ;
 
}

void draw() {
  
  angle += 0.01 ; // Draw incrémente la valeur en radians de l'angle
  
  // Calcul de la position
  x = round ((width/2 - 80) + sin(angle) * rayon) ; // round arrondit à l'entier le plus proche
  y = round ((height/2 - 60) + cos(angle) * rayon) ;
  
  // Affichage comme on affiche une image
  image (monFilm, x, y) ;
  
}



