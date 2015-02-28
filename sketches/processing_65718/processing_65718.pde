

void setup() {
  size(600,600); // Taille de la fenetre (width,height)
  smooth(); // Anti-aliasing
  noCursor(); // On cache le curseur de la souris
  stroke(255); // Couleur de contour = Blanc
  frameRate(30); // Nombre d'images affichées par seconde
  background(0); // Fond noir
}

void draw() {
saveFrame("exports/img-####.tiff");
}

void mouseDragged() {
  // Puis on fait dessiner une ligne entre la position
  // actuelle de la souris et sa position précédente
  line(pmouseX,pmouseY,mouseX,mouseY);
}

/*
void keyPressed() { 
  if (key == 's') { saveFrame("exports/img-####.tiff"); }
}
*/

