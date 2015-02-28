
float xRect;
float yRect;
float xRond;
float yRond;
float diametre; //Valeur qui sert de diametre mais aussi pour dessiner le rectangle
float etatRond;
float etatRect;
float n;
float nombreLignes;
float nombreTranches;


void setup () {
  size (400, 400);
  smooth ();
  noStroke ();

  xRect = 290;
  yRect = 200;
  xRond = 110;
  yRond = 200;
  diametre = 60;
  etatRond = 0;
  etatRect = 0;
}

void draw () {
  //Dessin du rectangle
  background (90, 2, 2);
  n = 0;
  strokeWeight (2);
  stroke (255);
  rectMode (CENTER);
  while (n < nombreLignes) {
    line (0, n*10, width, n*10);
    n = n + 1;
  }
  //Condition pour dessiner les lignes derrière
  if (etatRect == 1) {
    fill (137, 85, 87);
    strokeWeight(3);
    stroke(255);

    if (nombreLignes < 50) {
      nombreLignes = nombreLignes + 1;
    }
  } 
  else {
    if (nombreLignes > 0) 
      nombreLignes = nombreLignes - 1;

    fill (229, 107, 111);
  }

  rect (xRect, yRect, diametre, diametre);

  //Dessin des rayons
  int nombreRayons = 30;
  int longueurRayons = 100;
  float tranche = TWO_PI / nombreRayons;
  float rads = 0;
  float ratio = 0.5;
  strokeWeight(3);
  stroke (255);
  while (rads < nombreTranches) {
    float xLigne1 = xRond + cos(rads) * longueurRayons * ratio;
    float yLigne1 = yRond + sin(rads) * longueurRayons * ratio;
    float xLigne2 = xRond + cos(rads) * longueurRayons;
    float yLigne2 = yRond + sin(rads) * longueurRayons;
    line (xLigne1, yLigne1, xLigne2, yLigne2);
    rads = rads + tranche;
  }
  
  //Condition pour dessiner les rayons
  if (etatRond == 1) {    
    fill (137, 85, 87);
    if (nombreTranches < 8) { 
      nombreTranches = nombreTranches + 0.5;
    }
  } 
  else {
    if (nombreTranches > 0) {
      nombreTranches = nombreTranches - 0.5;
    }
    fill (229, 107, 111);
  }

  ellipse (xRond, yRond, diametre, diametre);
}

void mousePressed () {
  //Bouton pour le cercle
  float distance = dist(mouseX, mouseY, xRond, yRond);
  if (distance < diametre) {

    if (etatRond == 0) {
      etatRond = 1;
    } 
    else {
      etatRond = 0;
    }
  }

  //Bouton pour le rectang;e
  float rectGauche = xRect - diametre/2;
  float rectDroite = xRect + diametre/2;
  float rectHaut = yRect - diametre/2;
  float rectBas = yRect + diametre/2;

  if (mouseX > rectGauche && mouseX < rectDroite && mouseY > rectHaut && mouseY < rectBas) {
    if (etatRect == 0) {
      etatRect = 1;
    } 
    else {
      etatRect = 0;
    }
  }
}

void mouseReleased () {
  etatRect = 0;
}
