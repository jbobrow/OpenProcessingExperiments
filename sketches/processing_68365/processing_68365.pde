
/*------------------------------------------------------------------------------------------------
 Travail de rattrapage - Boutons & Boucle
 Par Ugo Dufour
 EDM4600 - UQAM 2012
-------------------------------------------------------------------------------------------------*/
 // Le code pour le dessin des anneaux est base sur le code de Thomas O. Fredericks - http://www.openprocessing.org/sketch/49766

// Declaration des variables
final int ON = 1;
final int OFF = 0;

int etatCercle, etatRectangle;

int cercleX = 133;
int cercleY = 200;
int rectangleX = 266;
int rectangleY = 200;

int cercleDiametre = 50;
int rectangleLargeur = 50;
int rectangleHauteur = 50;

int gauche = rectangleX - rectangleLargeur/2;
int droite = rectangleX + rectangleLargeur/2;
int haut = rectangleY - rectangleHauteur/2;
int bas = rectangleY + rectangleHauteur/2;

int nombreDeRayons = 20;
int longueurDesRayons = 50;
float tranche = TWO_PI / nombreDeRayons;

float circleCount = 0;
float rectangleCount = 0;


// Fonction de setup et declaration initiale des etats a OFF
void setup() {

  size(400, 400);
  smooth();

  etatCercle = OFF;
  etatRectangle = OFF;
  
}


// Fonction draw qui dessine le cercle et le rectangle
void draw () {
  
  background(127);

// Dessin des lignes horizontales
  int i = 0;
  stroke(0);
  strokeWeight(5);
  while (i <  rectangleCount) {
    line(0, i*20+10, width, i*20+10);
    i = i + 1;
  } 
  drawRectangle();

// Dessin des lignes autour du cercle
  strokeWeight(5);
  stroke(0);
  float rads = 0;
  while ( rads < circleCount ) {
    float x1 = cercleX + cos(rads) * (cercleDiametre/2 + 5);
    float y1 = cercleY + sin(rads) * (cercleDiametre/2 + 5);
    float x2 = cercleX + cos(rads) * longueurDesRayons;
    float y2 = cercleY + sin(rads) * longueurDesRayons;
    line(x1, y1, x2, y2);
    rads = rads + tranche;
  }
  drawCercle();
  
}


// Fonction qui determine les actions lors du clic de la souris
void mousePressed() {

// Determine si le clic de la souris est a l'interieur du cercle ainsi que le changement d'etat lors du clic de souris  
  float distance = dist(mouseX, mouseY, cercleX, cercleY);
  if (distance < cercleDiametre/2) {
    if (etatCercle == OFF) {
      etatCercle = ON;
    } 
    else {
      etatCercle = OFF;
    }
  }

// Determine si le clic de la souris est a l'interieur du rectangle ainsi que le changement d'etat lors du clic de souris  
  if (mouseX > gauche  && mouseX < droite && mouseY < bas && mouseY > haut) {
    if (etatRectangle == OFF) {
      etatRectangle = ON;
    }
  }
  
}


// Fonction qui change l'etat du cercle lorsque le bouton de la souris est relache
void mouseReleased() {

  etatRectangle = OFF;
  
}  


// Dessin du cercle
void drawCercle() {
  
  if (etatCercle == ON) {
    if (circleCount < 6) {
      circleCount = circleCount + 0.3;
    }
    fill(255, 5, 201);
  } 
  else {
    if (circleCount > 0 ) {
      circleCount = circleCount - 0.3;
    }
    fill(58, 255, 0);
  }
  noStroke();
  ellipse (cercleX, cercleY, cercleDiametre, cercleDiametre);
  
}


// Dessin du rectangle  
void drawRectangle() {

  if (etatRectangle == ON) {
    if (rectangleCount < 20) {
      rectangleCount = rectangleCount + 1;
    }
    fill(255, 5, 201);
  }
  else { 
    if (rectangleCount > 0) { 
      rectangleCount = rectangleCount - 1;
    }
    fill(58, 255, 0);
  }
  noStroke();
  rectMode(CENTER);
  rect (rectangleX, rectangleY, rectangleLargeur, rectangleHauteur);
  
}
