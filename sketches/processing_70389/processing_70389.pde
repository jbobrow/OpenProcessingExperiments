
/*------------------------------------------------------------------
 Travail 2 - Le Monstre interactif
 Par Ugo Dufour
 EDM4600 - UQAM 2012
 -------------------------------------------------------------------*/

// Declaration des variables
  float x, y;

  boolean oeil1Ferme, oeil2Ferme, oeil3Ferme;

// Declaration des tableaux et leurs grosseurs 
  int[] hauteurDentBas = new int[7];
  int[] hauteurDentHaut = new int[4];
  int[] hauteurDentBasFerme = new int[7];
  int[] hauteurDentHautFerme = new int[4];
  int[] xDentBas = new int[7];
  int[] xDentHaut = new int[4];
  int rayonVentre = 38;
  int counterForColor = 0;
  int etatDents;
  int couleurDent; 
  int conditionCandy;
  int timeStamp;
  int interval;
  int timeStampDentFerme;
  int intervalDentFerme;
  int token;
  
  int conditionOeil1, conditionOeil2, conditionOeil3;
  int couleurR, couleurG, couleurB;
  
  float alphaCandy;
  float assouplissement = 0.005;
  float xCandy, yCandy, xCandyCible, yCandyCible;
  float interval1, interval2, interval3, intervalCandy, intervalCondition, intervalDents;
  float timeStamp1, timeStamp2, timeStamp3,timeStampCandy, timeStampInterval, timeStampDents;  
  float xCiblePositionOeil1, yCiblePositionOeil1, xCiblePositionOeil2, yCiblePositionOeil2, xCiblePositionOeil3, yCiblePositionOeil3;
  float couleurOeilR1, couleurOeilR2, couleurOeilR3, couleurOeilG1, couleurOeilG2, couleurOeilG3, couleurOeilB1, couleurOeilB2, couleurOeilB3;
  float xPositionOeil1, xPositionOeil2, xPositionOeil3, yPositionOeil1, yPositionOeil2, yPositionOeil3, largeurOeil1, largeurOeil2, largeurOeil3, hauteurOeil1, hauteurOeil2, hauteurOeil3;
 

void setup() {
  
   // Configuration de la scene
    size(400, 400);
    background(0);
    smooth();
    
  // Positionnement des x et y au milieu
    x = width/2;
    y = height/2;
  
  // Initialisation des variables  
    oeil1Ferme = false;
    oeil2Ferme = false;
    oeil3Ferme = false;

    xPositionOeil1 = x-138;
    xPositionOeil2 = x;
    xPositionOeil3 = x+138;
    yPositionOeil1 = y-80;
    yPositionOeil2 = y-120;
    yPositionOeil3 = y-80;
  
    xCiblePositionOeil1 = xPositionOeil1;
    yCiblePositionOeil1 = yPositionOeil1;
    xCiblePositionOeil2 = xPositionOeil2;
    yCiblePositionOeil2 = yPositionOeil2;
    xCiblePositionOeil3 = xPositionOeil3;
    yCiblePositionOeil3 = yPositionOeil3;
  
    couleurOeilR1 = 128;
    couleurOeilR2 = 244;
    couleurOeilR3 = 229;
    couleurOeilG1 = 0;
    couleurOeilG2 = 247;
    couleurOeilG3 = 127;
    couleurOeilB1 = 0;
    couleurOeilB2 = 57;
    couleurOeilB3 = 16;
    largeurOeil1 = 70;
    largeurOeil2 = 70;
    largeurOeil3 = 70;
    hauteurOeil1 = 50;
    hauteurOeil2 = 50;
    hauteurOeil3 = 50;
    
    couleurR = 50;
    couleurG = 170;
    couleurB = 10;
    
    xCandy= x - 400;
    yCandy= y + 400;
    couleurDent = 255;
    alphaCandy = 240;
    xCandyCible = xCandy;
    yCandyCible = yCandy;
    
    interval1 = random(2000, 10000);
    interval2 = random(2000, 10000);
    interval3 = random(2000, 10000); 
    intervalCandy = 3000;
    intervalCondition = 3009;
    intervalDents = 1000;
    interval = 0;
    intervalDentFerme = 400;
    token = 0;
    
    dessinerOeilOuvert1();
    dessinerOeilOuvert2();
    dessinerOeilOuvert3();

  // Remplissage des tableaux pour la construction des dents
    for (int i = 0 ; i < hauteurDentBas.length ; i++) {
      hauteurDentBas[i] = (int) random(5, 17);
    }

    for (int i = 0 ; i < hauteurDentHaut.length ; i++) {
      hauteurDentHaut[i] = (int) random(5, 17);
    } 

    for (int i = 0 ; i < hauteurDentBasFerme.length ; i++) {
      hauteurDentBasFerme[i] = 19;
    }

    for (int i = 0 ; i < hauteurDentHautFerme.length ; i++) {
      hauteurDentHautFerme[i] = 19;
    }
  
    int tempDent1 = 160;
    for (int i = 0 ; i < xDentBas.length ; i++) {
      xDentBas[i] = tempDent1;
      tempDent1 = tempDent1 + 14;
    }
  
    int tempDent2 = 178;
    for (int i = 0 ; i < xDentHaut.length ; i++) {
      xDentHaut[i] = tempDent2;
      tempDent2 = tempDent2 + 14;
    }
   
}


void draw() {

  // Dessin du background
    background (0);   
  
  // Initialisation de variable locale
    float multiplicateurVentre = 0.51;
    
  // Calcul pour savoir si la souris est dans le ventre du monstre 
    float distanceVentre = dist((mouseX*multiplicateurVentre), mouseY, x - ((1 - multiplicateurVentre)*x), y + 85);
  
  // Section qui determine la position de l'oeil et son mouvement
    if (millis() - timeStamp >= interval) {
      xCiblePositionOeil1 = random (xPositionOeil1 - 10, xPositionOeil1 + 10);
      yCiblePositionOeil1 = random (yPositionOeil1 - 20, yPositionOeil1 + 20);
  
      xCiblePositionOeil2 = random (xPositionOeil2 - 20, xPositionOeil2 + 20);
      yCiblePositionOeil2 = random (yPositionOeil2 - 10, yPositionOeil2 + 10);
  
      xCiblePositionOeil3 = random (xPositionOeil3 - 10, xPositionOeil3 + 10);
      yCiblePositionOeil3 = random (yPositionOeil3 - 20, yPositionOeil3 + 20);
  
      timeStamp = timeStamp + interval;
    }
  
    interval = 1000;
  
  // Section qui limite le mouvement de l'oeil ainsi que l'assouplissement du mouvement
    xPositionOeil1 = constrain(( (xCiblePositionOeil1 - xPositionOeil1) * assouplissement + xPositionOeil1), x - 158, x - 118);
    yPositionOeil1 = constrain(( (yCiblePositionOeil1 - yPositionOeil1) * assouplissement + yPositionOeil1), y - 100, y - 60);
  
    xPositionOeil2 = constrain(( (xCiblePositionOeil2 - xPositionOeil2) * assouplissement + xPositionOeil2), x - 20, x + 20);
    yPositionOeil2 = constrain(( (yCiblePositionOeil2 - yPositionOeil2) * assouplissement + yPositionOeil2), y - 140, y - 100);
  
    xPositionOeil3 = constrain(( (xCiblePositionOeil3 - xPositionOeil3) * assouplissement + xPositionOeil3), x + 118, x + 158);
    yPositionOeil3 = constrain(( (yCiblePositionOeil3 - yPositionOeil3) * assouplissement + yPositionOeil3), y - 100, y - 60);
  
  // Appel des fonctions pour dessiner differentes parties du monstre  
    dessinerOeilFerme1();  
   
    dessinerOeilFerme2();
  
    dessinerOeilFerme3();
  
    dessinerMonstre();
  
  // Sert a determiner si on dessine les dents ouvertes ou les dents fermes
    if ((mousePressed) && (distanceVentre < rayonVentre)) {
      dessinerDentsFerme();
    }
    else {
      dessinerDentsOuverte();
    }
  
  // Deplacement du bonbon sur la bouche du monstre et aussi le faire disparaitre apres l'interval  
    if (conditionCandy == 1) {
      xCandyCible = x;
      yCandyCible = y - 7; 
    
    // Dessin du bonbon que le monstre mange      
      for (int i = 40; i > 0; i--) {
        xCandy = (xCandyCible - xCandy)*0.009 + xCandy;
        yCandy = (yCandyCible - yCandy)*0.009 + yCandy; 
        fill(random(256), random(256), random(256), alphaCandy);   
        ellipse (xCandy, yCandy, i, i);
        if (millis() - timeStampDentFerme >= intervalDentFerme){
            timeStampDentFerme = timeStampDentFerme + intervalDentFerme;
            token = 1;
        }
     
        if (token == 1) {
          dessinerDentsFerme();
        }
       
      }
      
      if (millis() - timeStampCandy >= intervalCandy && conditionCandy == 1) {
        timeStampCandy = timeStampCandy + intervalCandy;
        alphaCandy = 0;
      }     
    }
        
    if (conditionCandy == 1 && alphaCandy == 0) {
      conditionCandy = 0;
    }
      
    if (counterForColor == 3 && conditionCandy == 0) {
      couleurR = (int) random(256);
      couleurG = (int) random(256);
      couleurB = (int) random(256);
    }
    else if (counterForColor == 4) {
      counterForColor = 1;
    }
    else {
      couleurR = 50;
      couleurG = 170;
      couleurB = 10;
    }
}


void mousePressed() {
  
  // Declaration et initialisation des variables locales  
    
    float gauche = x - 115/2;
    float droite = x + 115/2;
    float haut = (y - 7) - 25;
    float bas = (y - 7) + 25;
    
  // Determination si l'oeil est dans le carre entourrant la bouche et reinitialisation apes un interval  
    if ( mouseX > gauche && mouseX < droite && mouseY > haut && mouseY < bas && conditionCandy ==0 ) {
      if (conditionCandy == 0) {
        conditionCandy = 1;
        counterForColor = counterForColor + 1;
      }
      else  {
        conditionCandy = 0;         
      }
      
      if (millis() - timeStampInterval >= intervalCondition) {
        timeStampInterval = timeStampInterval + intervalCondition;
        alphaCandy = 255;
        xCandy= x - 400;
        yCandy= y + 400;
      }
    }
}


void dessinerMonstre() {

  // Corp du monstre
    stroke(50);
    strokeWeight(4);
    fill(couleurR, couleurG, couleurB);
    beginShape();
    curveVertex(x + 100, y + 75);
    curveVertex(x + 50, y - 50);
    curveVertex(x - 50, y - 50);
    curveVertex(x - 100, y + 75);
    curveVertex(x - 65, y + 125);
    curveVertex(x + 65, y + 125);
    curveVertex(x + 100, y + 75);
    curveVertex(x + 50, y - 50);
    curveVertex(x - 50, y - 50);
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

  // Bras Gauche  
    pushMatrix();
    fill(couleurR, couleurG, couleurB);
    translate(x, y);
    rotate(0.3);
    translate(x - (x + 75), y - (y - 10));
    ellipse(0, 0, 25, 35);  
    popMatrix();

  // Bras Droite
    fill(couleurR, couleurG, couleurB);
    pushMatrix();
    translate(x, y);
    rotate(2.9);
    translate(x - (x + 75), y - (y + 10));
    ellipse(0, 0, 25, 35);  
    popMatrix();

  // Jambe gauche
    fill(couleurR, couleurG, couleurB);
    pushMatrix();
    translate(x, y);
    rotate(PI/2);
    translate(x - (x - 140), y - (y - 60));
    ellipse(0, 0, 40, 50);  
    popMatrix();

  // Jambe droite
    fill(couleurR, couleurG, couleurB);
    pushMatrix();
    translate(x, y);
    rotate(3*PI/2);
    translate(x - (x + 140), y - (y - 60));
    ellipse(0, 0, 40, 50);  
    popMatrix();

  // Ventre du monstre
    noStroke();
    fill(140, 220, 100);
    ellipse(x, y + 85, 150, 76);

  // Narines 50 170 10
    fill(0, 0, 0);
    ellipse(x - 10, y - 45, 5, 8);
    ellipse(x + 10, y - 45, 5, 8);
}


void dessinerOeilOuvert1() {  

  // Tiges qui vont du corp aux yeux
    stroke(50);
    strokeWeight(6);
    line(x, y, xPositionOeil1, yPositionOeil1);

  // Yeux du monstre - Partie qui change de couleur
    stroke(50);
    strokeWeight(3);
    fill(couleurOeilR1, couleurOeilG1, couleurOeilB1);
    ellipse(xPositionOeil1, yPositionOeil1, largeurOeil1, hauteurOeil1);

  // Yeux du monstre - Partie noire
    fill(255);
    noStroke();
    ellipse(xPositionOeil1, yPositionOeil1, largeurOeil1*0.3, largeurOeil1*0.3);

  // Determination des valeurs necessaires pour que la pupille suive la souris et reste dans l'oeil
    float distance1 = dist(mouseX, mouseY, xPositionOeil1, yPositionOeil1);
    distance1 = constrain(distance1, 0, (largeurOeil1*0.3) - (largeurOeil1*0.1) - 8);

  // Calcul de l'angle en radians ainsi que la determiation de la position X et Y de la pupulle
    float radians1 = atan2(mouseY-yPositionOeil1, mouseX-xPositionOeil1); 
    float pupilleX1 = cos(radians1)* distance1 + xPositionOeil1;
    float pupilleY1 = sin(radians1)* distance1 + yPositionOeil1; 

  // Yeux du monstre - Partie blanche
    fill(0);
    noStroke();
    ellipse(pupilleX1, pupilleY1, largeurOeil1*0.12, largeurOeil1*0.12);
}


void dessinerOeilOuvert2() {  

  // Tiges qui vont du corp aux yeux
    stroke(50);
    strokeWeight(6);
    line(x, y, xPositionOeil2, yPositionOeil2);

  // Yeux du monstre - Partie qui change de couleur
    stroke(50);
    strokeWeight(3);
    fill(couleurOeilR2, couleurOeilG2, couleurOeilB2);
    ellipse(xPositionOeil2, yPositionOeil2, largeurOeil2, hauteurOeil2);

  // Yeux du monstre - Partie noire
    fill(255);
    noStroke();
    ellipse(xPositionOeil2, yPositionOeil2, largeurOeil2*0.3, largeurOeil2*0.3);

  // Determination des valeurs necessaires pour que la pupille suive la souris et reste dans l'oeil
    float distance2 = dist(mouseX, mouseY, xPositionOeil2, yPositionOeil2);
    distance2 = constrain(distance2, 0, (largeurOeil2*0.3) - (largeurOeil2*0.1) - 8);

  // Calcul de l'angle en radians ainsi que la determiation de la position X et Y de la pupulle
    float radians2 = atan2(mouseY-yPositionOeil2, mouseX-xPositionOeil2); 
    float pupilleX2 = cos(radians2)* distance2 + xPositionOeil2;
    float pupilleY2 = sin(radians2)* distance2 + yPositionOeil2;

  // Yeux du monstre - Partie blanche
    fill(0);
    noStroke();
    ellipse(pupilleX2, pupilleY2, largeurOeil2*0.12, largeurOeil2*0.12);
}


void dessinerOeilOuvert3() {  

  // Tiges qui vont du corp aux yeux
    stroke(50);
    strokeWeight(6); 
    line(x, y, xPositionOeil3, yPositionOeil3);

  // Yeux du monstre - Partie qui change de couleur
    stroke(50);
    strokeWeight(3);
    fill(couleurOeilR3, couleurOeilG3, couleurOeilB3);
    ellipse(xPositionOeil3, yPositionOeil3, largeurOeil3, hauteurOeil3);

  // Yeux du monstre - Partie noire
    fill(255);
    noStroke();
    ellipse(xPositionOeil3, yPositionOeil3, largeurOeil3*0.3, largeurOeil3*0.3);

  // Determination des valeurs necessaires pour que la pupille suive la souris et reste dans l'oeil
    float distance3 = dist(mouseX, mouseY, xPositionOeil3, yPositionOeil3);
    distance3 = constrain(distance3, 0, (largeurOeil3*0.3) - (largeurOeil3*0.1) - 8);

  // Calcul de l'angle en radians ainsi que la determiation de la position X et Y de la pupulle
    float radians3 = atan2(mouseY-yPositionOeil3, mouseX-xPositionOeil3); 
    float pupilleX3 = cos(radians3)* distance3 + xPositionOeil3;
    float pupilleY3 = sin(radians3)* distance3 + yPositionOeil3;

  // Yeux du monstre - Partie blanche
    fill(0);
    noStroke();
    ellipse(pupilleX3, pupilleY3, largeurOeil3*0.12, largeurOeil3*0.12);
 }


void dessinerOeilFerme1() {

  //  Calcul du temps et intervals pour faire fermer ou ouvrir l'oeil
    if (millis() >= timeStamp1 + interval1) {
      timeStamp1 = millis();
      if (oeil1Ferme) {
        oeil1Ferme = false;
        interval1 = random(4000, 8000);
      } 
      else {
        oeil1Ferme = true;
        interval1 = random(500, 800);
      }
    }
    
  // Dessin de l'oeil ferme
    if (oeil1Ferme) {
      stroke(50);
      strokeWeight(6);
      line(x, y, xPositionOeil1, yPositionOeil1);
  
    // Yeux du monstre - Partie qui change de couleur
      stroke(50);
      strokeWeight(3);
      fill(0);
      ellipse(xPositionOeil1, yPositionOeil1, largeurOeil1, hauteurOeil1);
      stroke(255);
      strokeWeight(2);
      line(xPositionOeil1 - 30, yPositionOeil1, xPositionOeil1 + 30, yPositionOeil1);
    } 
    else {
      dessinerOeilOuvert1();
    }
}


void dessinerOeilFerme2() {
  
  //  Calcul du temps et intervals pour faire fermer ou ouvrir l'oeil
    if (millis() >= timeStamp2 + interval2) {
      timeStamp2 = millis();
      if (oeil2Ferme) {
        oeil2Ferme = false;
        interval2 = random(4000, 8000);
      } 
      else {
        oeil2Ferme = true;
        interval2 = random(500, 800);
      }
    }

  // Dessin de l'oeil ferme
    if (oeil2Ferme) {
      stroke(50);
      strokeWeight(6);
      line(x, y, xPositionOeil2, yPositionOeil2);
  
    // Yeux du monstre - Partie qui change de couleur
      stroke(50);
      strokeWeight(3);
      fill(0);
      ellipse(xPositionOeil2, yPositionOeil2, largeurOeil2, hauteurOeil2);
      stroke(255);
      strokeWeight(2);
      line(xPositionOeil2 - 30, yPositionOeil2, xPositionOeil2 + 30, yPositionOeil2);
    } 
    else {
      dessinerOeilOuvert2();
    }
}


void dessinerOeilFerme3() {
  
  //  Calcul du temps et intervals pour faire fermer ou ouvrir l'oeil
    if (millis() >= timeStamp3 + interval3) {
      timeStamp3 = millis();
      if ( oeil3Ferme ) {
        oeil3Ferme = false;
        interval3 = random(4000, 8000);
      } 
      else {
        oeil3Ferme = true;
        interval3 = random(500, 800);
      }
    }
    
  // Dessin de l'oeil ferme
    if ( oeil3Ferme ) {
      stroke(50);
      strokeWeight(6);
      line(x, y, xPositionOeil3, yPositionOeil3);
  
    // Yeux du monstre - Partie qui change de couleur
      stroke(50);
      strokeWeight(3);
      fill(0);
      ellipse(xPositionOeil3, yPositionOeil3, largeurOeil3, hauteurOeil3);
      stroke(255);
      strokeWeight(2);
      line(xPositionOeil3 - 30, yPositionOeil3, xPositionOeil3 + 30, yPositionOeil3);
    } 
    else {
      dessinerOeilOuvert3();
    }
}


void dessinerDentsOuverte() {  
  
  // Boucle while pour les dents du bas
    strokeWeight(2);
    fill(couleurDent);
    rectMode(CENTER);
    for (int i = 0 ; i < hauteurDentBas.length ; i++) {
      rect(xDentBas[i], y + 12 - hauteurDentBas[i]*0.5, 7, hauteurDentBas[i]);   
    }
    
  // Bouche while pour les dents du haut
    rectMode(CORNER);
    fill(couleurDent);
    for (int i = 0 ; i < hauteurDentHaut.length ; i++) {
      rect(xDentHaut[i], y - 27, 7, hauteurDentHaut[i]);
    }
}


void dessinerDentsFerme() {  

  // Boucle while pour fermer les dents du bas
    strokeWeight(2);
    fill(couleurDent);
    rectMode(CENTER);
    for (int i = 0 ; i < hauteurDentBasFerme.length ; i = i + 1) {
      rect(xDentBas[i], y + 12 - hauteurDentBasFerme[i]*0.5, 7, hauteurDentBasFerme[i]);  
    }

  // Bouche while pour les dents du haut
    rectMode(CORNER);
    fill(couleurDent);
    for (int i = 0 ; i < hauteurDentHautFerme.length ; i++) {
      rect(xDentHaut[i], y - 27, 7, hauteurDentHautFerme[i]);
    }
}
