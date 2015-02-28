
// Copyright Olivier Baudu 2013 for the Labomedia
// Published under the terms of the GPL v3.0 license
// http://labomedia.org


Cluster[] clusters;
int tailleBit, tailleParcours, nbClusters, nbBit;
int bord, nbCLusterParLigne, nbLignes;

void setup() {

  tailleBit =10;
  nbBit = 10;
  bord = 1;
  tailleParcours = 50;
  nbLignes = 7;  
  nbCLusterParLigne = 4;
  
  nbClusters = nbCLusterParLigne * nbLignes;
  noStroke();

  //size(nbCLusterParLigne*(tailleBit+bord)*nbBit, nbLignes*(tailleParcours+tailleBit+bord));
  size(440, 427);  


  clusters = new Cluster[nbClusters];
  for (int i=0; i<clusters.length; i++) {
    clusters[i] = new Cluster(i%nbCLusterParLigne, int(i/nbCLusterParLigne));
  }
}

void draw() {
  background(0);

  for (int i=0; i < clusters.length; i++) {
    clusters[i].dessine();
  }
}

class Cluster {

  int initIA, decalage;
  Bit[] Bits;

  Cluster (int posX, int posY) {

    Bits = new Bit[nbBit];
    initIA = 0;
    decalage = int(random(1000));

    for (int i=0; i<Bits.length; i++) {
      Bits[i] = new Bit(i*(tailleBit+bord) + posX*(nbBit*(tailleBit+bord)) + 1, 
      (tailleParcours + tailleBit + bord)*posY + 1);
    }
  }

  void dessine() {

    actionIA();

    for (int i=0; i < Bits.length; i++) {
      Bits[i].dessine();
    }
  }

  void actionIA() { 

    if (frameCount%(nbBit+500+decalage) == 1) {
      initIA = 0;
    }
    if (frameCount%int(random(nbBit*2)+1) == 0) {
      if (initIA >=0 && initIA < nbBit) {
        Bits[initIA].choixIA = true;
      }
      initIA++;
    }
  }
}

class Bit {

  int x, y, initX, initY;
  int vitesse, direction;
  boolean testAction, posHaut, choixIA;

  Bit (int posX, int posY) {

    initX = posX;
    initY = posY;
    x = posX;
    y = posY;

    direction = 1;
    vitesse = 2;
    testAction = false;
    posHaut = true;
    choixIA = false;
  }

  void dessine() {
    testRollOver(x, y);
    deplace();
    rect(x, y, tailleBit, tailleBit);
  }

  void deplace() {
    if (testAction) {

      if (posHaut && y <= initY+tailleParcours+vitesse  ) {
        direction = 1;
        if (y == initY+tailleParcours+vitesse) {
          posHaut = false;
          testAction = false;
          choixIA = false;
        }
      }
      if (!posHaut && y >= initY+vitesse  ) {
        direction = -1;
        if (y == (initY+vitesse)) {
          posHaut = true;
          testAction = false;
          choixIA = false;
        }
      }
      y += direction*vitesse;
    }
  }

  void testRollOver(int posX, int posY) {

    if (mouseX >= posX && mouseX <= posX+tailleBit && 
      mouseY >= posY && mouseY <= posY+tailleBit && 
      testAction == false || choixIA) {
      testAction = true;
    }
  }
}


