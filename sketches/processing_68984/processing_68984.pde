
/************************
 Deux Bouttons
 Par Simon Gauthier
 UQAM 2012    EDM4600
*************************/

// Sources des inspirations et des exemples utilisés sont de provenance de Thomas O. Fredericks à l'adresse www.openprocessing.org/classroom/1228
 
// Déclaration des variables
int etatCercle;
int etatRectangle;
int gauche = 266 - 55/2;
int droite = 266 + 55/2;
int haut = 200 - 55/2;
int bas = 200 + 55/2;
float tranche = TWO_PI / 10;
float circleCount = 0;
float rectangleCount = 0;
final int ON = 1;
final int OFF = 0;


// Fonction de départ et états à OFF
void setup() {
 
  size(400, 400);
  smooth();
 
  etatCercle = OFF;
  etatRectangle = OFF;
   
}
 
 
// Fonction draw pour le cercle et le rectangle
void draw () {
   
  background(36, 45, 67);
 
// lignes horizontales
  int a = 0;
  stroke(0);
  strokeWeight(7);
  while (a <  rectangleCount) {
  line(0, a*20+10, width, a*20+10);
  a = a + 1;
  }
  drawRectangle();
 
// lignes autour du cercle et doit être placé après le rectangle pour que les lignes de background soient derrière le cercle
strokeWeight(7);
stroke(0);
float rads = 0;
while ( rads < circleCount ) {
float x1 = 133 + cos(rads) * (50/2 + 5);
float y1 = 200 + sin(rads) * (50/2 + 5);
float x2 = 133 + cos(rads) * 70;
float y2 = 200 + sin(rads) * 70;
line(x1, y1, x2, y2);
  rads = rads + tranche;
  }
  drawCercle();
   
}
 
 
// Actions réalisés lors du clic de la souris
void mousePressed() {
 
// Vérifie si le clic de la souris est a l'interieur du cercle et effectue le changement d'etat lors du clic de souris 
  float distance = dist(mouseX, mouseY, 133, 200);
  if (distance < 50/2) {
    if (etatCercle == OFF) {
      etatCercle = ON;
    }
    else {
      etatCercle = OFF;
    }
  }
 
// Vérifie si le clic de la souris est à l'interieur du rectangle et éffectue le changement d'état lors du clic de souris 
  if (mouseX > gauche  && mouseX < droite && mouseY < bas && mouseY > haut) {
    if (etatRectangle == OFF) {
      etatRectangle = ON;
    }
  }
   
}
 
 
// Actions à faire lorsque le bouton de la souris est relaché
void mouseReleased() {
 
  etatRectangle = OFF;
   
} 
 
 

 
 
// Dessin du rectangle 
void drawRectangle() {
 
  if (etatRectangle == ON) {
    if (rectangleCount < 20) {
      rectangleCount = rectangleCount + 1;
    }
    fill(4, 255, 180);
  }
  else {
    if (rectangleCount > 0) {
      rectangleCount = rectangleCount - 1;
    }
    fill(255, 0, 10);
  }
  noStroke();
  rectMode(CENTER);
  rect (266, 200, 55, 55);
   
}


// Dessin du cercle
void drawCercle() {
   
  if (etatCercle == ON) {
    if (circleCount < 6) {
      circleCount = circleCount + 0.3;
    }
    fill(4, 255, 180);
  }
  else {
    if (circleCount > 0 ) {
      circleCount = circleCount - 0.3;
    }
    fill(255, 0, 10);
  }
  noStroke();
  ellipse (133, 200, 50, 50);
   
}

//SG 2012
