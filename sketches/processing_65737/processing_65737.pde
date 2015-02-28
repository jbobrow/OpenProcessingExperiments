

// Import de la librairie video - Présenter la doc
import processing.video.* ;

// Déclaration d'un objet Movie
Movie monFilm ;

// Position de la fenetre
int x = screen.width/2 - 300 ; // On centre la fenetre
int y = screen.height/2 - 300 ;

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
  
  // Affichage comme on affiche une image
  image (monFilm, 220, 240) ;
  
  // Déplacer la fenetre
  frame.setLocation (x,y) ; // Position
  if (x < screen.width/2) { // Limite
  x++ ; y++ ; // Incrémente les valeurs x et y
  }
  else { x = screen.width/2 - 300 ; y = screen.height/2 - 300 ; } // Replacement
  
}

// Controler la vidéo à l'aide du clavier
void keyPressed() {
 
   if (key == 'p') { monFilm.pause() ; } ;
   if (key == 's') { monFilm.stop() ; } ;
   if (key == 'g') { monFilm.play() ; } ;
  
}

/*
// Méthode appelée à chaque fois qu'une image vidéo est disponible à l'affichage
void movieEvent (Movie m) {
  m.read() ; // Processing l'enregistre et l'affiche
}
*/

