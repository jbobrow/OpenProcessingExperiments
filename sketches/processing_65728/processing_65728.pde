

// Variables pour calculer les vitesses X et Y de la souris
int dimX, dimY ;

// Création d'un objet de forme :
PShape Taches1 ;
PShape Taches2 ;
PShape Taches3 ;

// Compteur pour faire changer de forme automatiquement
int compteur = 1 ;

void setup() {
  size(600,600) ;
  background(0) ;
  frameRate(45);
  smooth();
  noCursor();
  Taches1 = loadShape("forme1.svg");
  Taches2 = loadShape("forme2.svg");
  Taches3 = loadShape("forme3.svg");
}

void draw() {
  
  // A chaque appel de draw, calcul séparé des vistesses
  // x et y de la souris :
  dimX = mouseX - pmouseX ;
  dimY = mouseY - pmouseY ;
  
  // Un peu d'illusion en faisant tourner les formes
  // de façon arbitraire :
  if (dimX > dimY) { Taches1.rotate(1) ; Taches2.rotate(2) ; Taches3.rotate(3) ; } // Radians
  if (dimY > dimX) { Taches1.rotate(2) ; Taches2.rotate(4) ; Taches3.rotate(6) ; }
  
  // Petit contrôle du signe de dimX et dimY :
  if (dimX < 0) { dimX = -dimX ; }
  if (dimY < 0) { dimY = -dimY ; }
  
  // Dessin de la forme :
  // shape (Objet de forme, x, y, largeur, hauteur);
  if (compteur == 1) { shape (Taches1, pmouseX, pmouseY, dimX + 50, dimY + 50) ; }
  if (compteur == 2) { shape (Taches2, pmouseX, pmouseY, dimX + 50, dimY + 50) ; }
  if (compteur == 3) { shape (Taches3, pmouseX, pmouseY, dimX + 50, dimY + 50) ; }
}

// Méthode appelée lors d'un clic de souris
void mousePressed() {
  if (compteur < 3) { compteur++ ; }
  else { compteur = 1 ; }
}

// Capture d'écran
void keyPressed() {
 if (key == 's') { saveFrame("exports/img-####.tiff"); } 
}



