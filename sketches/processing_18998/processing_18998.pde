
float posX;
float posY;
float largeur;
float hauteur;
float hauteurCabine;
float largeurCabine;
float rayon;

void setup() {
  size(256,256);
  posX = 0;
  posY = random(0,height);
  largeur = 30;
  hauteur = 10;
  hauteurCabine = 8;
  largeurCabine = 16;
  rayon = 4;
  noStroke();
  smooth();
}

void draw() {
  background(220);
  
  // Déplacement
  posX = posX + 1;
 
  if (posX > width + largeur) {
    posX = -largeur;
    posY = random(0,height);
  }
  
  // Dessiner voiture
  fill(40);
  // Carosserie
  rect(posX,posY,largeur,hauteur);
  // Cabine
  rect( posX+largeur/2-largeurCabine/2 , posY-hauteurCabine , largeurCabine , hauteurCabine );
  // Roues
  ellipseMode(RADIUS);
  ellipse( posX+rayon*1.5 , posY+hauteur+rayon , rayon , rayon );
  ellipse( posX+largeur-rayon*1.5 , posY+hauteur+rayon , rayon , rayon );
}               
