
// Jean-Michel Leblanc - Le Monstre intéractif - EDM4600

/* ==============================================================================================================
   La grosse tête du monstre est intéractive (Drag And Drop).
   Les étoiles sont disposées aléatoirement et elles clignotent.
   Le corps robotisé du monstre s'active lors d'un clic de souris jusqu'à relâchement.
   ============================================================================================================== */

// ----------------------- Déclaration des variables -----------------------
// Scène
float x;
float y;

// Personnage
float gTeteX;
float gTeteY;
float couFix;
float pTete;
float corps;
float corpsX;
float corpsY;
float vitesseX;
float vitesseY;
float positionX;
float positionY;
float vX;
float vY;

// Étoiles
float[] tableauX;
float[] tableauY;
final int nbEtoiles = 300;

// État du personnage
int etatCorps;
int etatTete;

// ----------------------- Initialisation de la surface de travail -----------------------
void setup(){  
  /* Taille de la surface de travail (en pixels), 
  antialiasing activé et aucune bordure aux formes */
  size(400, 400);
  smooth();
  
  // ----------------------- Initialisation des propriétés des variables -----------------------
  x = width/2;
  y = height/2;
  vX = 0;
  vY = 0;
  couFix = x;
  gTeteX = x;
  gTeteY = y;
  pTete = x;
  corpsX = x;
  corpsY = y;
  tableauX = new float[nbEtoiles];
  tableauY = new float[nbEtoiles];

  // Positionnement aléatoire des étoiles sur la scène
  int i = 0;
  while (i < nbEtoiles) {
    tableauX[i] = random(0,width);
    tableauY[i] = random(0,height);
    i++;
  }
}

// ----------------------- Fonction d'initialisation des dessins -----------------------
void draw(){
  // Couleur du ciel
  background(23, 19, 31);  
  
  drawDecor();
  drawMonstre();
}

// ----------------------- Paysage -----------------------

void drawDecor(){
  // Placement des étoiles dans le ciel
  fill(255);
  
  for ( int i = 0; i < nbEtoiles ; i++ ) {
    ellipse( tableauX[i], tableauY[i], random(-2,2), random(-2,2));
  }
  
  // Planète
  float d = 400;
  float difference = 5;
  
  while ( d > 0 ) {
    fill ( d / 2 );
    ellipse( x+70 , y+270 , d , d );
    d = d - difference;
  }
}

// ----------------------- Monstre -----------------------

void drawMonstre(){
  // Ombre du personnage
  fill (130);
  ellipse(x+50, y+110, 130, 40);
  
  // ----------------------- Corps robotisé du personnage ----------------------- 
  // Interaction avec le corps robotisé
  if (mousePressed && etatTete == 0){
    // Vérification de la zone cliquable
    if ( mouseX > 190 && mouseX < 310 && mouseY > 175 && mouseY < 310 ) {
      // Validation de l'état
      if ( etatCorps == 0 ) {
        etatCorps = 1;
      }
    }
  } else {
    etatCorps = 0;
  }
  
  // Vibration du corps selon l'état du personnage
  if (etatCorps == 1){
    if (corpsX < 202 && corpsX > 198 && corpsY < 202 && corpsY > 198){
      corpsX += random(-0.5, 0.5);
      corpsY += random(-0.5, 0.5);
    } else {
      corpsY = x;
      corpsX = y; 
    }
  } else {
    corpsY = x;
    corpsX = y;
  }
  
  // Les roues
  noStroke();
  ellipseMode(CENTER);
  fill(40);
  ellipse(corpsX+10, corpsY+105, 25, 25);
  ellipse(corpsX+60, corpsY+105, 25, 25);
  ellipse(corpsX+93, corpsY+95, 25, 25);
    
  // Le corps métallique P.1
  strokeJoin(ROUND);
  stroke(150, 168, 183);
  fill(150, 168, 183);
  strokeWeight(20.0);
  beginShape();
    vertex(corpsX+30, corpsY-10);
    vertex(corpsX+30, corpsY+90);
    vertex(corpsX+100, corpsY+90);
    vertex(corpsX+100, corpsY-10);
    vertex(corpsX+30, corpsY-10);
  endShape();
  
  // Fix de la perspective
  line(corpsX+100, corpsY+90, corpsX+70, corpsY+100);
  line(corpsX+30, corpsY-10, corpsX, corpsY);
  
  // Le corps métallique P.2
  strokeJoin(ROUND);
  stroke(210, 228, 242);
  fill(210, 228, 242);
  strokeWeight(20.0);
  beginShape();
    vertex(corpsX, corpsY);
    vertex(corpsX, corpsY+100);
    vertex(corpsX+70, corpsY+100);
    vertex(corpsX+70, corpsY);
    vertex(corpsX, corpsY);
  endShape();

  // Trous pour la tête des personnages
  noStroke();
  fill(40);
  ellipse(corpsX+35, corpsY+25, 25, 25);
  ellipse(corpsX+55, corpsY-15, 25, 5);
  
  // Panneau de contrôle sur le côté du personnage
  beginShape();
    vertex(corpsX+85, corpsY+20);
    vertex(corpsX+85, corpsY+80);
    vertex(corpsX+105, corpsY+74);
    vertex(corpsX+105, corpsY+14);
    vertex(corpsX+85, corpsY+20);
  endShape();
  
  fill(255);
  beginShape();
    vertex(corpsX+90, corpsY+25);
    vertex(corpsX+90, corpsY+35);
    vertex(corpsX+100, corpsY+32);
    vertex(corpsX+100, corpsY+22);
    vertex(corpsX+90, corpsY+25);
  endShape();
  
  // Changement de couleur aléatoire des boutons
  if (etatCorps == 1){
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(corpsX+95, corpsY+46, 11, 15);
    
    fill(random(0,255), random(0,255), random(0,255));
    ellipse(corpsX+95, corpsY+64, 11, 15);
    
  } else {
    fill(180, 0, 0);
    ellipse(corpsX+95, corpsY+46, 11, 15);
    
    fill(37, 99, 99);
    ellipse(corpsX+95, corpsY+64, 11, 15);
  }
  
  
  // ----------------------- Tête du petit monstre -----------------------
  //Cou
  strokeJoin(ROUND);
  strokeWeight(8.0);
  stroke(255, 158, 0);
  line(pTete+55, pTete-18, pTete+55, pTete-70);
  
  // Tête
  noStroke();
  float dPetiteTete = 70;
  float diffPetiteTete = 5;
  float fillPetiteTete1 = 255;
  float fillPetiteTete2 = 158;
   
  while ( dPetiteTete > 5 ) {
     fill (fillPetiteTete1, fillPetiteTete2, 0);
     ellipse(pTete+55, pTete-70, dPetiteTete, dPetiteTete);
     fillPetiteTete1 = fillPetiteTete1 - 5;
     fillPetiteTete2 = fillPetiteTete2 - 5;
     dPetiteTete = dPetiteTete - diffPetiteTete;
  }

  
  // Yeux + pupilles
  fill(155, 96, 0);
  ellipse(pTete+57, pTete-73, 17, 20);
  fill(255);
  ellipse(pTete+57, pTete-75, 17, 20);
  fill(0);
  ellipse(pTete+59, pTete-73, 5, 7);
  fill(255);
  ellipse(pTete+60, pTete-75, 3, 3);
  
  fill(155, 96, 0);
  ellipse(pTete+77, pTete-73, 20, 30);
  fill(255);
  ellipse(pTete+77, pTete-75, 20, 30);
  fill(0);
  ellipse(pTete+75, pTete-73, 9, 12);
  fill(255);
  ellipse(pTete+77, pTete-77, 4, 4);
  
  // Grains de beauté
  fill(155, 96, 0);
  ellipse(pTete+35, pTete-85, 3, 4);
  ellipse(pTete+42, pTete-88, 5, 6);
  ellipse(pTete+35, pTete-93, 7, 8);
  
  // ----------------------- Tête du gros monstre -----------------------
  // Variables locales pour l'assouplissement
  float ratio = 0.2;    
  float k = 0.04;
  float d = 0.9;

  // Vérification de l'état de la tête (drag de souris)
  if (etatTete == 1){
    float accelX = k * ((mouseX + 100) - gTeteX);
    float accelY = k * ((mouseY + 80) - gTeteY);
    vX = d * (vX + accelX);  
    vY = d * (vY + accelY);     
    gTeteX = gTeteX + vX;  
    gTeteY = gTeteY + vY;
  } else {
    float accelX = k * (x - gTeteX);
    float accelY = k * (y - gTeteY);
    vX = d * (vX + accelX);  
    vY = d * (vY + accelY);     
    gTeteX = gTeteX + vX;  
    gTeteY = gTeteY + vY;
  }
  
  // Cou
  noFill();
  strokeJoin(ROUND);
  strokeWeight(16.0);
  stroke(255, 158, 0);
  beginShape();
    curveVertex(couFix, couFix-400);
    curveVertex(couFix+35, couFix+25);
    curveVertex(gTeteX-90, gTeteY);
    curveVertex(gTeteX, gTeteY-400);
  endShape();
  
  // Tête
  noStroke();
  fill(255, 158, 0);
  beginShape();
    curveVertex(gTeteX, gTeteY);
    curveVertex(gTeteX-90, gTeteY+15);
    curveVertex(gTeteX-60, gTeteY);
    curveVertex(gTeteX-50, gTeteY-50);
    curveVertex(gTeteX-35, gTeteY-80);
    curveVertex(gTeteX-45, gTeteY-130);
    curveVertex(gTeteX-100, gTeteY-150);
    curveVertex(gTeteX-130, gTeteY-130);
    curveVertex(gTeteX-150, gTeteY-100);
    curveVertex(gTeteX-150, gTeteY-50);
    curveVertex(gTeteX-130, gTeteY);
    curveVertex(gTeteX-90, gTeteY+15);
    curveVertex(gTeteX-90, gTeteY+15);
  endShape();
  
  // Yeux + pupilles + cernes
  
  // Gauche
  fill(155, 96, 0);
  rect(gTeteX-138, gTeteY-73, 15, 2);
  fill(155, 96, 0);
  ellipse(gTeteX-128, gTeteY-73, 20, 30);
  fill(255);
  ellipse(gTeteX-130, gTeteY-75, 20, 30);
  fill(0);
  ellipse(gTeteX-130, gTeteY-75, 10, 15);
  fill(255);
  ellipse(gTeteX-128, gTeteY-82, 8, 8);
  
  
  // Droite
  fill(155, 96, 0);
  ellipse(gTeteX-99, gTeteY-71, 50, 70);
  fill(255);
  ellipse(gTeteX-100, gTeteY-75, 50, 70);
  fill(0);
  ellipse(gTeteX-95, gTeteY-81, 30, 50);
  fill(255);
  ellipse(gTeteX-90, gTeteY-100, 10, 10);
      
  // Grains de beauté
  fill(155, 96, 0);
  ellipse(gTeteX-60, gTeteY-100, 10, 12);
  ellipse(gTeteX-48, gTeteY-110, 15, 17);
  ellipse(gTeteX-65, gTeteY-120, 20, 22);
  
  // Bouche
  fill(173, 58, 62);
  ellipse(gTeteX-120, gTeteY-15, 25, 20);
  fill(85, 25, 16);
  ellipse(gTeteX-118, gTeteY-12, 18, 13);
    
  // Mâchoire
  fill(155, 96, 0);
  ellipse(gTeteX-68, gTeteY-38, 20, 22);
  fill(255, 158, 0);
  ellipse(gTeteX-70, gTeteY-40, 20, 22);
  
  fill(0);
}

// Interactivité de la tête du personnage
void mousePressed() {
  float zoneClic = dist(mouseX, mouseY, 110, 130);
  
  if (zoneClic < 80) {
    etatTete = 1;
  } else {
    etatTete = 0;
  }
}

// Release l'état de la tête lorsque la souris est relâchée
void mouseReleased() {
  etatTete = 0;
}
