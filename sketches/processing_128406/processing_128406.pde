
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Monstre interactif fait par Etienne DÃ©niger
//  dans le cadre du cours d'Algorithme de base et interactivitÃ© (EDM4600)
//  UQÃ�M, Mars 2013
//
//
//  EMPLACEMENT DES FONCTIONNALITÃ�S:
//  
//  - Zone interactive circulaire: fonction draw (permet de dÃ©clancher une fonction dans la classe Particules)
//  - Zone interactive rectangulaire: fonction display() dans la classe Tentacules
//  - Assouplissement: Classe Particules, dans la fonction mouseEvent() et dans la classe Contour, la fonction changementCouleur
//  - Timer: Classe Contour: permet de changer la couleur du couleur
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
float x = 400 / 2;
float y = 400 / 2 - 60;
color couleurBackground = color(0, 0, 0);
//tableau utilisÃ© pour crÃ©er les tableau du contour et de l'intÃ©rieur
float [][] arrayContour = new float [][] {
  {
    x-54, y+55, x+133, y+60, x+108, y-20, x+28, y-85, x-42, y-85, x-109, y-25, x-144, y+60, x-54, y+60, x+133, y+60, x+108, y-20
  }
};
//variables oscillation////////////////////////////////////////////////////////////////////
float counterOscillation;
float niveauOscillation = 10;
float vitesseOscillation = 0.08;
//variables et tableau interieur///////////////////////////////////////////////////////////
int nbInterieur = 75;
float[] tOpaciteInterieur = new float [nbInterieur];
float[][] tableauInterieur = new float [nbInterieur][arrayContour[0].length];
float[] tStrokeInterieur = new float [nbInterieur];
float couleurRInterieur = 55;
float couleurGInterieur = 204;
float couleurBInterieur = 188;
float couleurRInterieurCible = 58;
float couleurGInterieurCible = 188;
float couleurBInterieurCible = 214;
int nbPointsInterieur = 300;
float[] tPositionInterieurX = new float[nbPointsInterieur];
float[] tPositionInterieurY = new float[nbPointsInterieur];
float[] tableauDiametreInterieur = new float[nbPointsInterieur];
float[][] tableauPointsInterieur = new float[nbPointsInterieur][arrayContour[0].length];
Interieur unInterieur;
//variables et tableau tentacules//////////////////////////////////////////////////////////
float nbTentacules = 100;
ArrayList arrayTentacule;
//variables et tableau contour/////////////////////////////////////////////////////////////
int in_blur = 17;
int out_blur = 17;
int epaisseur = 3;
float[][] tableauInBlur = new float [in_blur][arrayContour[0].length];
float[][] tableauOutBlur = new float [out_blur][arrayContour[0].length];
color couleurContour = color(61, 135, 191);
float couleurRContour = 61;
float couleurGContour = 135;
float couleurBContour = 191;
float couleurRContourCible = 58;
float couleurGContourCible = 105;
float couleurBContourCible = 214;
int opacite = 120;
Contour unContour;
//variables et tableau particules/////////////////////////////////////////////////////////
int ratioParticules = 5;
boolean activerAnimParticules;
ArrayList arrayParticule;
/**
 *
 *  Fonction setup()
 *
 */
void setup() {
  size(400, 400,P3D);
  background(couleurBackground);
  smooth();
  frameRate(60);
  activerAnimParticules = false;
  for (int i = 0;i < tOpaciteInterieur.length;i++) tOpaciteInterieur[i] = random(20, 80);
  for (int i = 0;i < tStrokeInterieur.length;i++) tStrokeInterieur[i] = random(2, 6);
  for (int i=0;i<nbPointsInterieur;i++) {
    tPositionInterieurX[i] = random(0, 90);
    tPositionInterieurY[i] = random(10, 40);
    tableauDiametreInterieur[i] = random(0.5, 1.5);
  } 
  unContour = new Contour(in_blur, out_blur, opacite);
  arrayTentacule = new ArrayList();
  // CrÃ©ation du ArrayList des tentacules
  for (int i = 0;i < nbTentacules;i++)arrayTentacule.add(new Tentacules(random(30, 60), i * (220/nbTentacules), random(-30, 40), random(1, 4), random(10, 40), random(0.05, 0.1)));
  unInterieur = new Interieur(random(1, 3), 60, random(-3, 3));
  arrayParticule = new ArrayList();
}
/**
 *
 *  Fonction draw()
 *
 */
void draw() {
  background(couleurBackground);
  counterOscillation = vitesseOscillation * frameCount;
  for (int i = 0;i < ratioParticules;i++)arrayParticule.add(new Particules(random(0, 20), random(x - 65, x + 65), random(y, y - 15), random(-20, 20), random(-30, 30)) );
  for (int i = 0;i < arrayTentacule.size() - 1;i++) {
    Tentacules uneTentacule = (Tentacules) arrayTentacule.get(i);
    uneTentacule.display();
  }
  unInterieur.display();
  float distance = dist(mouseX, mouseY, x, y);
  for (int i = 0;i < arrayParticule.size() - 1;i++) {
    Particules uneParticule = (Particules) arrayParticule.get(i);
    uneParticule.display();
    if (distance < 80) uneParticule.mouseEvent();
    if (! uneParticule.vieParticule)arrayParticule.remove(i);
  }
  unContour.display();
  y = sin(counterOscillation) * niveauOscillation + (height / 2) - 60;
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Classe: Contour
//  Permet de crÃ©er et d'afficher le contour de la mÃ©duse
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
class Contour {
  // PROPRIÃ�TÃ�S
  //-------------------------------------------------------------------------------------------------
  int inBlur, outBlur, opacite, timeStamp, interval, compteur;
  float rC, gC, bC, rI, gI, bI;
  boolean etatCouleur;
  Contour(int _inBlur, int _outBlur, int _opacite) {
    // CONSTRUCTEUR
    //-------------------------------------------------------------------------------------------------
    inBlur = _inBlur;
    outBlur = _outBlur;
    opacite = _opacite;
    interval = 1;
    compteur = 0;
    rC = couleurRContour;
    gC = couleurGContour;
    bC = couleurBContour;
    rI = couleurRInterieur;
    gI = couleurGInterieur;
    bI = couleurBInterieur;
  }
  /**
   *
   *  Fonction display()
   *  Anime la couleur du contour Ã  l'aide d'un timer
   *  Appel la fonction updateArray(), pour rÃ©cupÃ©rer les positions du contour
   *  CrÃ©e le contour
   *
   */
  void display() {
    if ( millis() - timeStamp >= interval ) {
      compteur+=interval;
      if (! etatCouleur && compteur < 150) {
        changementCouleur(rC, gC, bC, 0.02);
        unInterieur.changementCouleur(rI, gI, bI, 0.05);
      } 
      else if (etatCouleur && compteur < 150) {
        changementCouleur(couleurRContourCible, couleurGContourCible, couleurBContourCible, 0.02);
        unInterieur.changementCouleur(couleurRInterieurCible, couleurGInterieurCible, couleurBInterieurCible, 0.05);
      } 
      else if (compteur == 150 && etatCouleur) {
        compteur = 0;
        etatCouleur = false;
      }
      else if (compteur == 150 && ! etatCouleur) {
        compteur = 0;
        etatCouleur = true;
      }
    }

    updateArray(outBlur, tableauOutBlur, arrayContour, 0, false, 1);
    updateArray(inBlur, tableauInBlur, arrayContour, 0, true, 1);
    noFill();
    strokeWeight(epaisseur);
    for (int u = 0;u < inBlur;u++) {
      stroke(couleurRContour, couleurGContour, couleurBContour, map(u, 0, inBlur, opacite, 0));
      beginShape();
      for (int d = 0;d < tableauInBlur[0].length - 2;d++) curveVertex(tableauInBlur[u][d], tableauInBlur[u][d += 1]);//-2 pour openprocessing
      endShape(CLOSE);
    }
    for (int t = 0;t < outBlur;t++) {
      stroke(couleurRContour, couleurGContour, couleurBContour, map(t, 0, outBlur, opacite, 0));
      beginShape();
      for (int r = 0;r < tableauOutBlur[0].length - 2;r++) curveVertex(tableauOutBlur[t][r], tableauOutBlur[t][r += 1]); //-2 pour openprocessing
      endShape(CLOSE);
    }
  }
  void changementCouleur(float cibleR, float cibleG, float cibleB, float vitesse) {
    couleurRContour = (cibleR - couleurRContour) * vitesse + couleurRContour;
    couleurGContour = (cibleG - couleurGContour) * vitesse + couleurGContour;
    couleurBContour = (cibleB - couleurBContour) * vitesse + couleurBContour;
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Classe: Interieur
//  Permet de crÃ©er et d'afficher l'intÃ©rieur de la mÃ©duse
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
class Interieur {
  // PROPRIÃ�TÃ�S
  //-------------------------------------------------------------------------------------------------
  float randomStroke, opacite, randomPosition, randomColor;
  Interieur(float _randomStroke, float _opacite, float _randomPosition) {
    // CONSTRUCTEUR
    //-------------------------------------------------------------------------------------------------
    randomStroke = _randomStroke;
    randomPosition = _randomPosition;
    opacite = _opacite;
  }
  /**
   *
   *  Fonction display()
   *  Anime la couleur du contour Ã  l'aide d'un timer
   *  Appel la fonction updateArray(), pour rÃ©cupÃ©rer les positions de l'intÃ©rieur
   *  Appel de la fonction etoile()
   *  CrÃ©e l'intÃ©rieur et le cercle au centre 
   *
   */
  void display() {
    updateArray(nbInterieur, tableauInterieur, arrayContour, randomPosition, true, 1);
    for (int u = 0;u < nbInterieur;u++) {
      strokeWeight( tStrokeInterieur[u]);
      stroke(couleurRInterieur, couleurGInterieur, couleurBInterieur, tOpaciteInterieur[u]);
      beginShape();
      for (int d = 0;d < tableauInterieur[0].length - 2;d++) curveVertex(tableauInterieur[u][d], tableauInterieur[u][d += 1]);
      endShape(CLOSE);
    }
    for (int j = 0;j < nbPointsInterieur;j++) {
      for (int c = 0;c < tableauPointsInterieur[0].length;c++) {
        if (c%2 == 0) {
          if (arrayContour[0][c] < x) {
            tableauPointsInterieur[j][c] = int(arrayContour[0][c] + (j * 0.01) + tPositionInterieurX[j]);
          }
          else {
            tableauPointsInterieur[j][c] = int(arrayContour[0][c] - (j * 0.01) - tPositionInterieurX[j]);
          }
        }
        else {
          if (arrayContour[0][c] < y) {
            tableauPointsInterieur[j][c] = sin(counterOscillation) * niveauOscillation + int(arrayContour[0][c] + (j * 0.01) + tPositionInterieurY[j]);
          }
          else {
            tableauPointsInterieur[j][c] = sin(counterOscillation) * niveauOscillation + int(arrayContour[0][c] - (j * 0.01) - tPositionInterieurY[j]);
          }
        }
      }
    }
    for (int u = 0;u < nbPointsInterieur;u++) {
      noStroke();
      if (u < nbPointsInterieur / 2 ) fill(255, random(10,45));
      else fill(255, random(10,45));
      for (int d = 0;d < tableauPointsInterieur[0].length;d++) {
        ellipse(tableauPointsInterieur[u][d], tableauPointsInterieur[u][d += 1], tableauDiametreInterieur[u], tableauDiametreInterieur[u]);
      }
    }

    etoile(12, x-5, y, 130, 130, -PI / 2.2, 0.09, 55);
    strokeWeight(1);
    noFill();
    for (int i=0;i<10;i++) {
      stroke(255, 0, 0, map(i, 0, 10, 13, 0));
      ellipse(x - 5, y, 95 + i, 95 + i);
      stroke(0, 255, 0, 10);
      ellipse(x - 5, y, 95 - i, 95 - i);
      stroke(0, 0, 255, map(i, 0, 10, 13, 0));
      ellipse(x - 5, y, 90 - i, 90 - i);
    }
    for (int i=0;i<40;i++) {
      noStroke();
      pushMatrix();
      ellipseMode(CENTER);
      translate(x, y);
      rotate(radians(20));
      fill(255, map(i, 0, 40, 7, 0));
      ellipse(0 - 5, 0, 125 + i, i * 0.25);
      rotate(radians(5));
      ellipse(0 - 5, 0, i * 0.25, 100 + i);
      popMatrix();
    }
    for (int i = 0;i < 75;i++) {
      noStroke();
      fill(199, 223, 242, map(i, 0, 125, 15, 0));
      ellipse(x - 5, y, 20 + i, 20 + i);
    }
  }
  /**
   *  Fonction etoile()
   *  La majoritÃ© du code de cette fonction a Ã©tÃ© pris sur www.processing.com
   *  
   */
  void etoile(int n, float cx, float cy, float w, float h, float etoiletAngle, float proportion, float opacite) {
    if (n > 2) {
      float angle = TWO_PI/ (2 *n);
      float dw, dh;
      w /= 2.0;
      h /= 2.0;
      fill(255, opacite);
      noStroke();
      beginShape();
      for (int i = 0; i < 2 * n; i++) {
        dw = w;
        dh = h;
        if (i % 2 == 1) {
          dw = w * proportion;
          dh = h * proportion;
        }
        vertex(cx + dw * cos(etoiletAngle + angle * i), 
        cy + dh * sin(etoiletAngle + angle * i));
      }
      endShape(CLOSE);
    }
  }
  void changementCouleur(float cibleR, float cibleG, float cibleB, float vitesse) {
    couleurRInterieur = (cibleR - couleurRInterieur) * vitesse + couleurRInterieur;
    couleurGInterieur = (cibleG - couleurGInterieur) * vitesse + couleurGInterieur;
    couleurBInterieur = (cibleB - couleurBInterieur) * vitesse + couleurBInterieur;
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Classe: Tentacules
//  Permet de d'afficher et d'animer les tentacules
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
class Tentacules {
  // PROPRIÃ�TÃ�S
  //-------------------------------------------------------------------------------------------------
  float opacite, randomPositionX, randomPositionY, randomOpacite, randomStroke, randomOscillation, randomVitesse;
  float oscillationCompteur, oscillationDuBas, oscillationDuHaut;
  boolean sourisGaucheDroite, sourisDroiteGauche, sourisHautBas, sourisBasHaut;
  float initVitesse;
  Tentacules(float _opacite, float _randomPositionX, float _randomPositionY, float _randomStroke, float _randomOscillation, float _randomVitesse) {
    // CONSTRUCTEUR
    //-------------------------------------------------------------------------------------------------
    opacite = _opacite;
    randomPositionX = _randomPositionX;
    randomPositionY = _randomPositionY;
    randomStroke = _randomStroke;
    randomOscillation = _randomOscillation;
    randomVitesse = _randomVitesse;
    initVitesse = randomVitesse;
  }
  /**
   *
   *  Fonction display()
   *  Anime les tentacules
   *  Mise en place d'une zone rectangulaire qui ralenti la vitesse des tentacules lorsqu'on place 
   *  la souris sur les tentacules
   *
   */
  void display() {
    sourisGaucheDroite = mouseX < x + 125;
    sourisDroiteGauche = mouseX > x - 125;
    sourisHautBas = mouseY < (y + 120) + 50;
    sourisBasHaut =  mouseY > (y + 120) - 50;
    oscillationCompteur = oscillationCompteur + randomVitesse;
    // variable oscillationDuBas et oscillationDuHaut prises sur le site http://wiki.t-o-f.info/
    float oscillationDuBas = cos( oscillationCompteur + radians(90)) * randomOscillation + x-100+randomPositionX;
    float oscillationDuHaut = cos( oscillationCompteur ) * (120+randomOscillation) + x-110+randomPositionX;
    noFill(); 
    stroke(255, opacite);
    strokeWeight(randomStroke);
    beginShape();
    curveVertex(x-100+randomPositionX, y + 59);
    curveVertex(x-100+randomPositionX, y + 59);
    curveVertex(oscillationDuBas, y + 135 + randomPositionY);
    curveVertex(oscillationDuHaut, y + 220 + randomPositionY);
    endShape();
    if (sourisGaucheDroite && sourisDroiteGauche && sourisHautBas && sourisBasHaut) randomVitesse = 0.012;
    else randomVitesse = initVitesse;
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Classe: Particules
//  Permet de d'afficher, d'animer et interaqir avec les particules situÃ©es au centre de la meduse
//
/////////////////////////////////////////////////////////////////////////////////////////////////////
class Particules {
  // PROPRIÃ�TÃ�S
  //-------------------------------------------------------------------------------------------------
  float opacite, randomPositionX, randomPositionY, randomOpacite, randomWidth, randomHeight, vitesseParticule, diametreMax, differenceOpacite, diametre;
  boolean opaciteMax, vieParticule;
  float compteurX, compteurY;
  Particules(float _opacite, float _randomPositionX, float _randomPositionY, float _randomWidth, float _randomHeight) {
    // CONSTRUCTEUR
    //-------------------------------------------------------------------------------------------------
    opacite = _opacite;
    randomPositionX = _randomPositionX;
    randomPositionY = _randomPositionY;
    randomWidth = _randomWidth;
    randomHeight = _randomHeight;
    opaciteMax = true;
    vieParticule = true;
    diametreMax = 6;
    differenceOpacite = diametreMax / 2;
    diametre = 0;
    compteurX = 0;
    compteurY = 0;
  }
  /**
   *  Fonction display()
   *  Permet d'afficher et d'animer les particules
   *  Les particules sont animÃ©es selon l'emplacement, qui est alÃ©atoire
   *  Lorsque une particule a une opacitÃ© de 0, son Ã©tat (vieParticule) devient Ã  false 
   *  elle est supprimÃ© de l'ArrayList (arrayParticule)
   */
  void display() {
    randomPositionX = (x - randomPositionX+randomWidth + random(-1, 1) + compteurX) / 8 + randomPositionX;
    randomPositionY = (y - randomPositionY+randomHeight + random(-1, 1) + compteurY) / 8 + randomPositionY;
    if (opaciteMax) {
      opacite += 10;
      if (diametre >= differenceOpacite) opaciteMax = false;
    }
    if (! opaciteMax) opacite -= 20;
    noStroke();
    fill(160, 255, 247, opacite);
    ellipse(randomPositionX, randomPositionY, diametre, diametre);
    diametre += 0.2;
    if (randomPositionX < x) compteurX --;
    else if (randomPositionX > x) compteurX ++;
    if (randomPositionY < y) compteurY --;
    else if (randomPositionY > y) compteurY ++;
    if (opacite < 0) {
      vieParticule = false;
    }
  }
  /**
   *  Fonction mouseEvent()
   *  Permet d'interagir avec les particules
   *  La particules se dirigent vers la souris lorsqu'elle a un certaine distance circulaire du milieu
   *  cette zone a Ã©tÃ© paramÃ©trÃ© dans le draw 
   */
  void mouseEvent() {
    randomPositionX = (mouseX - randomPositionX + random(-4, 4)) / 6 + randomPositionX;
    randomPositionY = (mouseY - randomPositionY + random(-4, 4)) / 6 + randomPositionY;
  }
}
/**
 *  Fonction updateArray()
 *  Permet de crÃ©er un tableau de coordonÃ©es pour le contour et l'intÃ©rieur de la mÃ©duse
 *  Permet de diminer ou d'augmenter la valeur de chaque coordonÃ©es dans le tableau
 *  Cette fonction permet de ne pas rÃ©pÃ©ter 2 fois le code ci-dessous
 */
void updateArray(float nbRepetition, float [][] mainArray, float [][] unArrayContour, float unRandom, boolean outOrIn, float ratioTransformation) {
  for (int j = 0;j < nbRepetition;j++) {
    for (int c = 0;c < mainArray[0].length;c++) {
      if (c%2 == 0) {
        if (unArrayContour[0][c] < x) {
          if (outOrIn) mainArray[j][c] = int(unArrayContour[0][c] + (j * ratioTransformation) - unRandom);
          else mainArray[j][c] = int(unArrayContour[0][c] - (j * ratioTransformation) + unRandom);
        }
        else {
          if (outOrIn) mainArray[j][c] = int(unArrayContour[0][c] - (j * ratioTransformation) + unRandom);
          else mainArray[j][c] = int(unArrayContour[0][c] + (j * ratioTransformation) - unRandom);
        }
      }
      else {
        if (arrayContour[0][c] < y) {
          if (outOrIn) mainArray[j][c] = sin(counterOscillation) * niveauOscillation + int(unArrayContour[0][c] + (j * ratioTransformation) - unRandom);
          else mainArray[j][c] = sin(counterOscillation) * niveauOscillation + int(unArrayContour[0][c] - (j * ratioTransformation) + unRandom);
        }
        else {
          if (outOrIn) mainArray[j][c] = sin(counterOscillation) * niveauOscillation + int(unArrayContour[0][c] - (j * ratioTransformation) + unRandom);
          else mainArray[j][c] = sin(counterOscillation) * niveauOscillation + int(unArrayContour[0][c] + (j * ratioTransformation) - unRandom);
        }
      }
    }
  }
}
