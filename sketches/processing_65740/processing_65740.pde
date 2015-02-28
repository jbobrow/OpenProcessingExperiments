

// Import de la librairie video - Présenter la doc
import processing.video.* ;

// Déclaration d'un objet MovieMaker
MovieMaker monQuicktime ;

void setup() {
  size(600,600); // Taille de la fenetre (width,height)
  smooth(); // Anti-aliasing
  noCursor(); // On cache le curseur de la souris
  stroke(255); // Couleur de contour = Blanc
  frameRate(30); // Nombre d'images affichées par seconde
  background(0); // Fond noir
  
  // Création de l'objet monQuicktime
  monQuicktime = new MovieMaker (this, width, height, "dessin.mov", 30, MovieMaker.H263, MovieMaker.HIGH);
  // Largeur, hauteur, nom du fichier, nombre d'images par seconde enregistrées (??), Codec, qualité, keyFramerate si nécessaire
  
}

void draw() {
  
// Commande pour ajouter une image au fichier vidéo à chaque appel de Draw  
monQuicktime.addFrame() ;

}

void mouseDragged() {
  // Puis on fait dessiner une ligne entre la position
  // actuelle de la souris et sa position précédente
  line(pmouseX,pmouseY,mouseX,mouseY);
}


void keyPressed() { 
  if (key == ' ') {
  monQuicktime.finish() ;
  exit();
}
}


