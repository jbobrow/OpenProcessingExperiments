

// Variables globales
int couleur = 0 ; // Variable de type "int" (integer), de nom "couleur"

void setup() {
  size(screen.width,screen.height); // Plein écran
  background(0);
  smooth();
  ellipseMode(CENTER);
  colorMode (HSB,100) ; // Mode Hue-Saturation-Brightness (de 0 à 100)
  noStroke() ; // Pas de contour aux formes
}

void draw() {
  
  // SI couleur < 100 ALORS couleur = couleur + 1 ;
  if (couleur < 100) {
    couleur++ ;
  }
  // SINON
  else { couleur = 0 ; }
  
  fill (couleur, 100, 100) ; // Remplissage (Hue, Saturation, Brightness)
  
  ellipse (mouseX,mouseY,(mouseY/2)+20,(mouseY/2)+20) ;
  // ellipse (x,y,largeur,hauteur) ;
}



