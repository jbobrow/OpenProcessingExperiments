
int etat;

void setup() {
  size(256, 256);
  smooth();


  etat =0 ;
}

void draw() {
  background(100);

 voiture( 100, 100, color(255, 100, 0) );
    voiture( 200, 200, color(0, 255, 100) );

  if ( etat == 0 ) {
    voiture( 50, 50, color(255, 255, 255) );
  } 
  else {
    voiture( mouseX, mouseY, color(255, 255, 255) );
  }
  
}

void mousePressed() {
  
  if ( etat == 0 ) {
    etat = 1;
  } else {
    etat = 0; 
  }
  
}

// Dessiner voiture
void voiture(float x, float y, color c) {

  float largeur = 30;
  float hauteur = 10;
  float rayon = 5;

  noStroke();
  fill(c);
  // Carosserie
  rect(x, y, largeur, hauteur);
  // Cabine
  rect( x+largeur/2-5, y-10, 10, 10 );
  // Roues
  ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
  ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
}

