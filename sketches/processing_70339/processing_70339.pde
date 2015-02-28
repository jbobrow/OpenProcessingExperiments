
/*************************************************
 MONSTRE INTÉRACTIF
 
 Par : Victoria Malenfant
 
 EDM4600 Algorithmie de bas et intéractivité
 Hiver 2012
 *************************************************/

final int OFF = 0;
final int ON = 1;

PImage arbre;

float etatAbeille; //Pour que l'abeille apparaisse et disparaisse
float etatAiles; //Pour animer les ailes
float etatBouche; //Pour changer plus facilement la forme de la bouche

float x; //S'applique sur tout le code. Pour facilement déplacer le monstre et les zones intéractives
float y; //S'applique sur tout le code. Pour facilement déplacer le monstre et les zones intéractives

//Pour l'assouplissement du changement de couleur du corps et des pupilles
float r, g, b;
float rCible;
float gCible;
float bCible;
float facteur;

float pustule = PI + HALF_PI;

//Pour que les pupilles suivent la souris. Aussi le point noir
float xLueurDroite;
float yLueurDroite;

float xLueurGauche;
float yLueurGauche;

float xPupilleDroite;
float xPupilleGauche;
float yPupille;

//Pour déplacer le nuage
float n;
float etatInitialNuage;
float randomYnuage;

//Pour déterminer si la souris clique dans l'espace intéractif carré mis sur le visage
float gaucheRect = x + 135;
float droiteRect = (x + 135) + 100;
float hautRect = y + 130;
float basRect = (y + 130) + 100;

//Pour déterminer si la souris passe sur le cercle mis sur le corps du monstre
float xCercle = x + 190;
float yCercle = x + 280;
float dCercle = x + 120;

//Minuterie pour le clignement des yeux
int interval = 4000;
int timeStamp;


void setup() {
  size (400, 400);
  smooth();
  noStroke(); 

  etatAiles = OFF;
  etatAbeille = OFF;
  etatBouche = ON;

  //Si on change simplement ces deux valeurs, tout le monstre + ces zones intéractives se déplacent également
  x = 0;
  y = 0;

  //Pour le déplacement du nuage
  n = -90;
  etatInitialNuage = 1;
  
  arbre = loadImage("arbre.png");
}



void draw() {  
  //Début code paysage
  background(162, 231, 255);
  fill(100);
  noStroke();
  rect(0, 170, 400, 230);
  //Fin code paysage
 

  //Début code cailloux
  strokeWeight(4);
  stroke(190);
  fill(190);
  ellipse(100, 200, 1, 1);
  ellipse(300, 250, 2, 2);
  ellipse(70, 370, 3, 3);
  fill(75);
  stroke(75);
  ellipse(370, 190, 1, 1);
  ellipse(50, 270, 2, 2);
  ellipse(210, 380, 3, 3);
  //Fin code cailloux

  //Appel des fonctions pour dessiner le soleil, le nuage, et tout le monstre
  soleil () ;
  nuage () ;
  image(arbre, 0, 0);
  monstre () ;

  //États pour dessiner facilement les deux bouches différentes
  if (etatBouche == ON) {
    //Début code grande bouche
    fill(211, 98, 113);
    strokeWeight(0);
    stroke(232, 63, 86);
    beginShape();
    curveVertex(x + 175, y + 98);
    curveVertex(x + 153, y + 192);
    curveVertex(x + 159, y + 216);
    curveVertex(x + 195, y + 199);
    curveVertex(x + 207, y + 173);
    curveVertex(x + 153, y + 192);
    curveVertex(x + 94, y + 125);
    endShape();
  } 
  else {
    //Début code petite bouche
    noStroke();
    fill(211, 98, 113); 
    ellipse(x + 175, y + 200, 20, 20);
  }
  //Fin états pour les deux bouches différentes

  //État si l'abeille est apparu  
  if (etatAbeille == ON) {
    //Début code de l'abeille
    stroke(0);
    fill(0);
    ellipse(mouseX, mouseY, 10, 20); //Corps abeille
    ellipse(mouseX, mouseY - 13, 8, 8); //Tête abeille
    strokeWeight(2);
    line(mouseX, mouseY + 10, mouseX, mouseY + 16); //Dard
    line(mouseX, mouseY - 13, mouseX - 8, mouseY - 19); //Antenne gauche
    line(mouseX, mouseY - 13, mouseX + 8, mouseY - 19); //Antenne droite
    stroke(246, 255, 0);
    strokeWeight(2);
    line(mouseX - 4, mouseY + 8, mouseX + 4, mouseY + 8); //Rayures corps abeille
    line(mouseX - 6, mouseY + 2, mouseX + 6, mouseY + 2); //Rayures corps abeille
    line(mouseX - 5, mouseY - 4, mouseX + 5, mouseY - 4); //Rayures corps abeille  

    /*Condition pour que la petite bouche n'apparaisse que si la l'abeille est présente 
     et qu'elle passe au dessus du corps*/
    float distance = dist( mouseX, mouseY, xCercle, yCercle);
    if ( distance < dCercle/2) {
      etatBouche = OFF;
    } 
    else {
      etatBouche = ON;
    }

    //Codes ailes de l'abeille
    stroke(255);
    fill(203, 203, 203); 

    //Pour animer les ailes
    if (etatAiles == OFF) {
      //Aile gauche
      pushMatrix();
      translate(mouseX - 8, mouseY);
      rotate(QUARTER_PI);
      ellipse(0, 0, 10, 15);
      popMatrix();

      //Aile droite
      pushMatrix();
      translate(mouseX + 8, mouseY);
      rotate(QUARTER_PI + HALF_PI);
      ellipse(0, 0, 10, 15);
      popMatrix();

      etatAiles = ON;
    } 
    else {
      //Aile gauche
      pushMatrix();
      translate(mouseX - 8, mouseY - 8);
      rotate(- QUARTER_PI);
      ellipse(0, 0, 10, 15);
      popMatrix();

      //Aile droite
      pushMatrix();
      translate(mouseX + 8, mouseY - 8);
      rotate(- QUARTER_PI - HALF_PI);
      ellipse(0, 0, 10, 15);
      popMatrix();
      etatAiles = OFF;
    }
  }
  //Pour que la bouche redevienne grande si l'abeille disparait
  if (etatAbeille == OFF) {
    etatBouche = ON;
  }
}

//Pour que l'abeille apparaisse et disparaisse quand on clique
void mousePressed() {
  if (etatAbeille == OFF) {
    etatAbeille = ON;
  } 
  else {
    etatAbeille = OFF;
  }
}

void monstre () {
 
  //Assouplissement pour le changement de couleur du corps et des pupilles
  facteur = 0.005;
  r = (rCible - r) * facteur + r;
  g = (gCible - g) * facteur + g;
  b = (bCible - b) * facteur + b;
  rCible = random (0, 255);
  gCible = random (0, 255);
  bCible = random (0, 255);
  
  // DÉBUT CODE CORPS GÉNÉRAL
  //Début code forme corps
  fill(r, g, b);
  stroke(r * 0.85, g * 0.85, b * 0.85);
  strokeWeight(3);
  beginShape();
  curveVertex(x + 34.0, y + 210.0);
  curveVertex(x + 157.0, y + 227.0);
  curveVertex(x + 113.0, y + 327.0);
  curveVertex(x + 288.0, y + 321.0);
  curveVertex(x + 336.0, y + 322.0);
  curveVertex(x + 338.0, y + 312.0);
  curveVertex(x + 243.0, y + 290.0);
  curveVertex(x + 222.0, y + 222.0);
  curveVertex(x + 241.0, y + 187.0);
  curveVertex(x + 261.0, y + 141.0);
  endShape();
  //Fin code forme corps  

  //Début code forme tête
  beginShape();
  curveVertex(x + 201, y + 84);
  curveVertex(x + 143, y + 143);
  curveVertex(x + 145, y + 224);
  curveVertex(x + 246, y + 188);
  curveVertex(x + 242, y + 168);
  curveVertex(x + 263, y + 153);
  curveVertex(x + 257, y + 129);
  curveVertex(x + 310, y + 192);
  curveVertex(x + 288, y + 81);
  curveVertex(x + 201, y + 84);
  curveVertex(x + 143, y + 142);
  curveVertex(x + 145, y + 224);
  endShape();
  //Fin code forme tête  

    //Début code bras
  arc(x + 199, y + 250, 15, 60, 0, PI);
  //Fin code bras

  //Début code petites pustules
  strokeWeight(2);
  arc(x + 200, y + 230, 5, 5, 0, pustule);
  arc(x + 160, y + 300, 7, 7, 0, pustule);
  arc(x + 230, y + 310, 5, 5, 0, pustule);
  arc(x + 230, y + 150, 5, 5, 0, pustule);
  arc(x + 190, y + 115, 7, 7, 0, pustule);
  arc(x + 260, y + 95, 5, 5, 0, pustule);
  //Fin code petites pustules

  //Début code du changement d'expression au visage quand on clique dessus. 
  if ( mousePressed && mouseX > gaucheRect && mouseX < droiteRect && mouseY > hautRect && mouseY < basRect) {
    stroke(0);
    strokeWeight(4);
    line(x + 135, y + 135, x + 215, y + 165);
    line(x + 135, y + 165, x + 215, y + 135);
    etatBouche = OFF;
  }  
  else {
    //Début code yeux blancs
    noStroke();
    fill(255, 255, 255);
    ellipse(x + 150, y + 150, 35, 35);
    ellipse(x + 200, y + 150, 28, 28);
    //Fin code yeux blancs

    //Début relief pour oeil gauche
    float x1 = x + 150;
    float y1 = y + 150;
    noStroke();
    float d = 35;
    float difference = 1;
    while (d > 5) {
      fill(255 - d / 70 * 105);
      ellipse(x1, y1, d, d);
      d = d - difference;
      //Fin relief pour oeil gauche
    }

    //Début relief pour oeil droit
    float x2 = x + 200;
    noStroke();
    float d2 = 28;
    while (d2 > 3) {
      fill(255 - d2 / 56 * 105);
      ellipse(x2, y1, d2, d2);
      d2 = d2 - difference;
    }
    //Fin relief pour oeil droit

    //Début code pupille. radiansG; G = Gauche D = Droite.
    fill(r, g, b);
    float radiansG = atan2 (mouseY - (y + 150), mouseX - (x + 150));
    float distancePupilleGauche = dist (mouseX, mouseY, x + 150, y + 150);

    distancePupilleGauche = constrain (distancePupilleGauche, 0, 35/2 - 20/2);

    xPupilleGauche = cos(radiansG)* distancePupilleGauche + x + 150;

    float radiansD = atan2 (mouseY - (y + 150), mouseX - (x + 200));
    float distancePupilleDroite = dist (mouseX, mouseY, x + 200, y + 150);

    distancePupilleDroite = constrain (distancePupilleDroite, 0, 28/2 - 13/2);

    xPupilleDroite = cos(radiansD)* distancePupilleDroite + x + 200;
    yPupille = sin(radiansG)* distancePupilleGauche + y + 150;

    arc(xPupilleGauche, yPupille, 20, 20, 0, PI+HALF_PI+QUARTER_PI);
    arc(xPupilleDroite, yPupille, 13, 13, 0, PI+HALF_PI+QUARTER_PI);
    //Fin code pupille 

    //Début code de la petite lueur blanche dans les yeux, gauche.
    float distanceGauche = dist (mouseX, mouseY, x + 150, y + 150);

    distanceGauche = constrain (distanceGauche, 0, 35/2 - 4/2);

    xLueurGauche = cos(radiansG)* distanceGauche + x + 150;
    yLueurGauche = sin(radiansG)* distanceGauche + y + 150;

    fill(255, 255, 255);
    ellipse(xLueurGauche, yLueurGauche, 4, 4);
    //Fin code lueur gauche

    //Début code de la petite lueur blanche dans les yeux, droite.
    float distanceDroite = dist (mouseX, mouseY, x + 200, y + 150);

    distanceDroite = constrain (distanceDroite, 0, 28/2 - 3/2);

    xLueurDroite = cos(radiansD)* distanceDroite + x + 200;
    yLueurDroite = sin(radiansD)* distanceDroite + y + 150;

    ellipse(xLueurDroite, yLueurDroite, 3, 3);
    //Fin code lueur droite

    //Début code pour le clignement des yeux
    if (millis () - timeStamp >= interval) {
      timeStamp = timeStamp + interval;
      fill (r, g, b);
      ellipse(x + 150, y + 150, 35, 35);
      ellipse(x + 200, y + 150, 28, 28);
    }// Fin code pour le clignement
  } 
  
}//Fin code pour le changement d'expression au visage



void nuage () {
  //Début code nuage
  noStroke();
  fill(255);
  ellipse(50 + n, 60 + randomYnuage, 72, 50);
  arc(47 + n, 79 + randomYnuage, 35, 30, 0, PI);

  pushMatrix();
  translate(74 + n, 72 + randomYnuage);
  rotate(- QUARTER_PI);
  arc(0, 0, 35, 30, 0, PI + HALF_PI);
  popMatrix();

  pushMatrix();
  translate(43 + n, 41 + randomYnuage);
  rotate(PI);
  arc(0, 0, 35, 30, 0, PI);
  popMatrix();

  pushMatrix();
  translate(70 + n, 50 + randomYnuage);
  rotate(PI + QUARTER_PI);
  arc(0, 0, 35, 30, 0, PI);
  popMatrix();
  //Fin code nuage

  //Début code pour déplacer le nuage
  if (etatInitialNuage == 0) {
    n = -90; 
    etatInitialNuage = 1;
    randomYnuage = random (0, 40);
  }

  if (etatInitialNuage == 1) {
    n = n + .5 ;
  }

  if ( 400 < n ) {
    etatInitialNuage = 0;
  }
  //Fin code pour déplacer le nuage
}

void soleil () {

  float xSoleil = 0;
  float ySoleil = 0;
  int rayons = 16;
  int longueurRayons = 78;

  float tranche = TWO_PI / rayons;
  float rads = 0;
  float ratio = 0.70;

  stroke(255, 211, 52, 200);
  strokeWeight(3);
  fill (255, 230, 0, 200);
  ellipse(0, 0, 100, 100);
  strokeWeight(5);
  while ( rads < TWO_PI ) {
    float x1 = xSoleil + cos(rads) * longueurRayons * ratio;
    float y1 = ySoleil + sin(rads) * longueurRayons * ratio;
    float x2 = xSoleil + cos(rads) * longueurRayons;
    float y2 = ySoleil + sin(rads) * longueurRayons;
    line(x1, y1, x2, y2);
    rads = rads + tranche;
  }
}


