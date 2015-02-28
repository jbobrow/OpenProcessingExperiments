
/*------------------------------------------------------------------
Travail 1 - Dessiner un Monstre
Par Ugo Dufour
EDM4600 - UQAM 2012
-------------------------------------------------------------------*/

// Variables pour la position
  float x;
  float y;
  
// Configuration de la scene
  size(400, 400);
  smooth();
  
// Positionnement des x et y au milieu
  x = width/2;
  y = height/2;
  
// Arriere Plan
  background(0);
  
// Boucle while qui determine la position et la quantite d'yeux.  
  int nombreOeils = (int) random(2, 6);
  while(nombreOeils != 0) {
    
  // Declatation des variables et des random  
    float xPositionOeil = random(x - 150, x + 150);
    float yPositionOeil = random(y - 150, y - 90);
    int couleurOeilR = (int) random(0, 256);
    int couleurOeilG = (int) random(0, 256);
    int couleurOeilB = (int) random(0, 256);
    float largeurOeil = random(60, 80);
    float hauteurOeil = random(40, 60);
    
  // Tiges qui vont du corp aux yeux
    stroke(50);
    strokeWeight(6);
    line(x, y, xPositionOeil, yPositionOeil);
  
  // Yeux du monstre - Partie qui change de couleur
    stroke(50);
    strokeWeight(3);
    fill(couleurOeilR, couleurOeilG, couleurOeilB);
    ellipse(xPositionOeil, yPositionOeil, largeurOeil, hauteurOeil);
  
  // Yeux du monstre - Partie noire
    fill(0);
    noStroke();
    ellipse(xPositionOeil, yPositionOeil, largeurOeil*0.3, hauteurOeil*0.4);
    
  // Yeux du monstre - Partie blanche
    fill(255);
    noStroke();
    ellipse(xPositionOeil, yPositionOeil, largeurOeil*0.1, hauteurOeil*0.2);
    
    nombreOeils = nombreOeils - 1;
  }
    
// Corp du monstre
  stroke(50);
  strokeWeight(4);
  fill(50, 170, 10);
  beginShape();
  curveVertex(x + 100, y + 75);
  curveVertex(x + 50 , y - 50);
  curveVertex(x - 50 , y - 50);
  curveVertex(x - 100, y + 75);
  curveVertex(x - 65 , y + 125);
  curveVertex(x + 65 , y + 125);
  curveVertex(x + 100, y + 75);
  curveVertex(x + 50 , y - 50);
  curveVertex(x - 50 , y - 50);
  endShape();
  
// Bouche du monstre
  stroke(50);
  strokeWeight(3);
  fill(20, 100, 10);
  beginShape();
  curveVertex(x - 30, y - 25);
  curveVertex(x - 50, y + 10);
  curveVertex(x + 50, y + 10);
  curveVertex(x + 30, y - 25);
  curveVertex(x - 30, y - 25);
  curveVertex(x - 50, y + 10);
  curveVertex(x + 50, y + 10);
  endShape();
  
// Boucle while pour les dents du bas 
  float xDentBas = x - 40;
  while(xDentBas < x + 45){
    int hauteurDentBas = (int) random(5, 17);
    strokeWeight(2);
    fill(255, 255, 255);
    rectMode(CENTER);
    rect(xDentBas, y+12-hauteurDentBas*0.5, 7, hauteurDentBas);
    xDentBas = xDentBas + 14;
  }
    
// Bouche while pour les dents du haut
  float xDentHaut = x - 22;
  while(xDentHaut < x + 25){
    int hauteurDentHaut = (int) random(5, 17);
    rectMode(CORNER);
    fill(255, 255, 255);
    rect(xDentHaut, y - 27, 7, hauteurDentHaut);
    xDentHaut = xDentHaut + 14;
  }
  
// Bras Gauche   
  pushMatrix();
  fill(50, 170, 10);
  translate(x, y);
  rotate(0.3);
  translate(x - (x + 75), y - (y - 10));
  ellipse(0, 0, 25, 35);   
  popMatrix();

// Bras Droite
  fill(50, 170, 10);
  pushMatrix();
  translate(x, y);
  rotate(2.9);
  translate(x - (x + 75), y - (y + 10));
  ellipse(0, 0, 25, 35);   
  popMatrix();
    
// Jambe gauche
  fill(50, 170, 10);
  pushMatrix();
  translate(x, y);
  rotate(PI/2);
  translate(x - (x - 140), y - (y - 60));
  ellipse(0, 0, 40, 50);   
  popMatrix();
  
// Jambe gauche
  fill(50, 170, 10);
  pushMatrix();
  translate(x, y);
  rotate(3*PI/2);
  translate(x - (x + 140), y - (y - 60));
  ellipse(0, 0, 40, 50);   
  popMatrix();
  
// Ventre du monstre
  noStroke();
  fill(140, 220, 100);
  ellipse(x, y + 85, 150, 75);
  
// Narines
  fill(0, 0, 0);
  ellipse(x - 10, y - 45, 5, 8);
  ellipse(x + 10, y - 45, 5, 8);
                                
