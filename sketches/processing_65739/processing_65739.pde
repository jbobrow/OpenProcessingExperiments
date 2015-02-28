

// Import de la librairie video - Présenter la doc
import processing.video.* ;

// Déclaration d'un objet Movie
Movie monFilm ;


void setup() {
 
  size (160,120,P2D);
  
  // Chargement de la video dans l'objet déclaré plus haut
  monFilm = new Movie (this, "station.mov");
  
  // Commande de boucle
  monFilm.loop() ;
  
  // Lecture lancée à l'ouverture
  monFilm.play() ;
  
  // Mode Ellipse
  ellipseMode(CORNER) ;
 
}

void draw() {
 
  background(0) ; //Background efface tout
  
  // A chaque fois qu'une image video est disponible :
  if (monFilm.available()) {
   
   for (int x = 0 ; x <= width ; x += 10) { // Scan de la largeur de la fenetre
     
     for (int y = 0 ; y <= height ; y += 10) { // Pour chaque point x, on balaie toute la hauteur y
    
    color couleur = monFilm.get (x,y) ; // Récupère la couleur du pixel
    fill (couleur); // Change la couleur de remplissage
    ellipse (x,y,10,10); // Dessine une ellipse à cet endroit-là
    
     }
   }
  }
  
}

