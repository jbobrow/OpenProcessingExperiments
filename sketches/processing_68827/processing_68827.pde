
/*-----------------------------------------------------------------------------
 TP2 - Travail de rattrapage (Boutons)
 Par Joel Lalancette
 EDM4600
 -----------------------------------------------------------------------------*/
//Declaration des variables
int etatR, etatC, n;
final int ON = 1;
final int OFF = 0;
int rectX = 260;
int rectY = 200;
int rectL = 50;
int rectH = 50;

int cercleX = 130;
int cercleY = 200;
int cercleD = 50;
int cercleL = 50;
int cercleH = 50;
int NRayons = 20;
int LRayons = 50;
float tranche = TWO_PI / NRayons;
float c = 0;

//=============================================================================
//Configuration du cadre et assignation des etats initiaux.
void setup() {
  size(400, 400);
  smooth();
  etatR = OFF;
  etatC = OFF;
}

//=============================================================================
// Dessin du rectangle et des lignes
void draw() {
  background(100, 100, 100);
  int i = 0;
  stroke(0);
  strokeWeight(4);
    while ( i < n ) { // condition
      line(0, i*20, height, i*20); // bloc de code
      i = i + 1 ; // incrementation
     }
       if ( etatR == ON ) {
         if ( n < 20 ) {
           n = n + 1;
         }
       
    fill(255, 0, 255);    
}
  else {
    if ( n > 0 ) {
      n = n - 1;
    }
    fill(0, 256, 0);
  }
  noStroke();
  rectMode(CENTER);
  rect(rectX, rectY, rectH, rectL);
  
//=============================================================================
//Dessin du cercle et des lignes
stroke(0);
strokeWeight(5);
float rads = 0;
  while ( rads < c) {
    float x1 = cercleX + cos(rads) * (cercleD/2 + 5);
    float y1 = cercleY + sin(rads) * (cercleD/2 + 5);
    float x2 = cercleX + cos(rads) * LRayons;
    float y2 = cercleY + sin(rads) * LRayons;
    line (x1,y1,x2,y2);
    rads = rads + tranche;
  }
  if (etatC == ON) {
  if (c < 6) {
    c = c + 0.3;
  }
  fill (255,0,200);
  }
  else {
    if (c > 0) {
      c = c - 0.3;
    }
    fill (60,255,0);
  }
  noStroke();
  ellipse (cercleX,cercleY,cercleD,cercleD);
  }
  
//=============================================================================
//Permet de trouver la position de la souris par rapport au changement d'etat
void mousePressed() {

  if ( mouseX > 235 && mouseX < 285 && mouseY > 175 && mouseY < 225 ) {
    if ( etatR == OFF ) {
      etatR = ON;
    } 
    else {
      etatR = OFF;
    }
  }
 float distance = dist(mouseX, mouseY, cercleX, cercleY);
 if (distance < cercleD/2) {
   if (etatC == OFF) {
   etatC = ON;
 }
 else {
   etatC = OFF;
}
}
}
//=============================================================================
//etat sur le click de la souris
void mouseReleased() {
  etatR = OFF;
}


