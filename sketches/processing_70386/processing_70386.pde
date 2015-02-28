
/* --------------------------------------------------------------------------
 Travail 2 : Monstre interactif
 Par Marc-André Brault (BRAM18028903)
 Dans le cadre du cours Algrothmie de base et interactivite (EDM4600)
 UQAM 2012
 -------------------------------------------------------------------------- */
// Variables pour la position
final int x = width/2;
final int y = height/2;
float mX; // nouveau mouseX
float mY; // nouveau mouseY

// Variables pour le easing des couleurs
float rCourante, gCourante, bCourante;
float rCiblee, gCiblee, bCiblee;
float rVitesse, gVitesse, bVitesse;
float k = 0.5;
float d = 0.90;

// Variables pour les bras
float largeurBras = 40;
float largeurArc = 120;
float hauteurArc = 120;
float angleBrasGauche = 0.0;
float angleBrasDroit = 0.0;
final int pointMedian_X = 200; // Point indiquant la moitie du robot
final int pivotGauche_X = -90;
final int pivotDroit_X = 90;
final int pivot_Y = 70;

// Variables etat
int etatBras;
int etatOeilG;
int etatOeilD;
final int ON = 1;
final int OFF = 0;

void setup() {
  // Configurer la scene
  size(400, 400);
  smooth();  
  frameRate(30);

  // Initialisation des états
  etatBras = ON;
  etatOeilG = ON;
  etatOeilD = ON;
}

void draw() {  
  // Ciel
  background(135, 206, 250);  
  
  // On déplace le point 0,0 (x,y) à 200,200
  pushMatrix();
  translate(200, 200);

  mX = mouseX;
  mY = mouseY;

  // Pivot des bras

  if (mY < 300 && etatBras == ON)
  {
    if (mX < pointMedian_X)
    {    
      angleBrasGauche = atan2(mY - pivot_Y, mX - pivotGauche_X)*-0.5;
    }
    else
    {    
      angleBrasDroit = atan2(mY - pivot_Y, mX - pivotDroit_X)*0.5;
    }
  }
  dessinerLeMonstre();

  popMatrix();
}

void dessinerLeMonstre() {
  // Gazon
  
  float largeurGazon = width;
  float hauteurGazon = width/4;
  rectMode(CENTER);
  noStroke();
  fill(50, 205, 50);
  rect(x, y+(width/2), largeurGazon, hauteurGazon);

  //// Corps

  float largeurCorps = width/2;
  float hauteurCorps = 300;
  rectMode(CENTER);
  noStroke();
  fill(139, 69, 19);
  rect(x, y-30, largeurCorps, hauteurCorps);

  //// Jambes

    float largeurJambe = 90;
  float hauteurJambe = 60;
  rectMode(CENTER);
  noStroke();
  fill(139, 69, 19);

  // Gauche
  rect(x-55, y+150, largeurJambe, hauteurJambe);

  // Droite
  rect(x+55, y+150, largeurJambe, hauteurJambe);

  //// Yeux

  float largeurOeil = 30;
  float hauteurOeil = 30;
  ellipseMode(CENTER);
  noStroke();
  
  if (mousePressed == true && etatOeilG == ON) {
    fill(255, 20, 147); // Couleur des yeux si état = ON
  }
  else {
    fill(0); // Couleur des yeux si état = OFF
  }

  // Gauche
  ellipse(x-65, y-140, largeurOeil, hauteurOeil);
  
  if (mousePressed == true && etatOeilD == ON) {
    fill(255, 20, 147);
  }
  else {
    fill(0);
  }
  
  // Droit
  ellipse(x+65, y-140, largeurOeil, hauteurOeil);

  //// Pupilles

  float largeurPupille = 8;
  float hauteurPupille = 8;

  ellipseMode(CENTER);
  noStroke();
  fill(255);

  // Gauche
  ellipse(x-65, y-140, largeurPupille, hauteurPupille);

  // Droit
  ellipse(x+65, y-140, largeurPupille, hauteurPupille);

  //// Bouche

  float largeurBouche = 132;
  float hauteurBouche = 100;
  rectMode(CENTER);
  noStroke();

  rVitesse = d * (rVitesse + k * (rCiblee - rCourante));
  rCourante = rCourante + rVitesse;
  gVitesse = d * (gVitesse + k * (gCiblee - gCourante));
  gCourante = gCourante + gVitesse;
  bVitesse = d * (bVitesse + k * (bCiblee - bCourante));
  bCourante = bCourante + bVitesse;

  fill(rCourante, gCourante, bCourante);
  rect(x, y-40, largeurBouche, hauteurBouche);

  //// Dents

  float largeurDent = 33;
  float hauteurDent = 25;
  float debutDentDuHaut = y - 90; // A quelle hauteur est la dent
  float debutDentDuBas = y + 10; // A quelle hauteur est la dent
  float departDent = x - 66; // Ou la dent commence
  float compteur = 0; // Controle le nombre de dents crees

  fill(255);

  // Rangee du haut
  while (compteur < 4) {

    beginShape();
    vertex(departDent, debutDentDuHaut);
    vertex(departDent + largeurDent, debutDentDuHaut);  
    vertex(departDent + (largeurDent/2), debutDentDuHaut + hauteurDent);   
    vertex(departDent, debutDentDuHaut);
    endShape();   

    departDent = departDent + largeurDent; // Pour etablir ou la prochaine dent sera tracee
    compteur += 1; // On augmente le compteur
  };

  departDent = x - 66; // reset de departDent
  compteur = 0; // reset du compteur

  // Rangee du bas
  while (compteur < 4) {

    beginShape();
    vertex(departDent, debutDentDuBas);
    vertex((departDent) + largeurDent, debutDentDuBas);  
    vertex((departDent) + (largeurDent/2), debutDentDuBas - hauteurDent);   
    vertex(departDent, debutDentDuBas);
    endShape();

    departDent = departDent + largeurDent;
    compteur += 1;
  };  

  dessinerBrasGauche();
  dessinerBrasDroit();
}

void mousePressed() 
{  
  // Détection rectangle bouche

  if (mouseX > 135 && mouseY > 112 && mouseX < (width - 135) && mouseY < 212)
  {
    rCiblee = random(255);
    gCiblee = random(255);
    bCiblee = random(255);

    if (etatBras == ON) {
      etatBras = OFF;
    }
    else {
      etatBras = ON;
    }
  }

  // Détection oeil gauche

  float distanceCercle = dist(mouseX, mouseY, 135, 60);

  if ( distanceCercle < 15 ) {
    if (etatOeilG == OFF) {
      etatOeilG = ON;
    }
    else if (etatOeilG == ON) {
      etatOeilG = OFF;
    }
  }
  
  // Détection oeil droit

  distanceCercle = dist(mouseX, mouseY, 265, 60);

  if ( distanceCercle < 15 ) {
    if (etatOeilD == OFF) {
      etatOeilD = ON;
    }
    else if (etatOeilD == ON) {
      etatOeilD = OFF;
    }
  }
}

void dessinerBrasGauche()
{
  noFill();
  stroke(139, 69, 19);
  strokeWeight(largeurBras);  

  pushMatrix();
  translate(0, 0);
  rotate(angleBrasGauche);    
  arc(-90, y + 70, largeurArc, hauteurArc, PI, TWO_PI-PI/2); 
  popMatrix();
}

void dessinerBrasDroit()
{
  noFill();
  stroke(139, 69, 19);
  strokeWeight(largeurBras);  

  pushMatrix();
  translate(0, 0);
  rotate(angleBrasDroit);    
  arc(90, y + 70, largeurArc, hauteurArc, TWO_PI-PI/2, TWO_PI);
  popMatrix();
}


