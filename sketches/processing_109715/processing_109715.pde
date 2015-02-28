
// Copyright Olivier Baudu 2013 for the Labomedia
// Published under the terms of the GPL v3.0 license
// http://labomedia.org

Patte[] pattes;

PVector positionCorps, positionCorpsPers;
int taillePatte, nbPatte;

void setup() {

  ///////// 
  taillePatte = 100;
  nbPatte = 20;
  /////////

  size(400, 400);
  smooth();
  noCursor();

  pattes = new Patte[nbPatte];

  for (int i=0; i<pattes.length; i++) {
    pattes[i] = new Patte(taillePatte);
  }
}

void draw() {

  background(255);
  
  positionCorps = new PVector(mouseX, mouseY);
  positionCorpsPers = new PVector(mouseX, mouseY+taillePatte/4);

  for (int i=0; i<pattes.length; i++) {

    if (pattes[i].positionPied.dist(positionCorps) > taillePatte) {
      pattes[i].initDeplacement();
    }

    pattes[i].dessine(positionCorps);
  }

  ellipse(positionCorps.x, positionCorps.y, 10, 5);
}

class Patte {

  PVector posCorps, positionPied, detinationPied;
  PVector vitesse, trajet;
  ;
  boolean action;
  int tangente, valBruit;


  Patte(int sizePatte) {

    action = false;
    valBruit = sizePatte*3/2;
    tangente = sizePatte/2;

    // Définie une position près du corps mais pas trop...
    positionPied = new PVector(0, 0);
  }

  void dessine (PVector corps) {

    posCorps = corps;

    // Dessine la pattes
    noFill();
    bezier(posCorps.x, posCorps.y, posCorps.x, posCorps.y, 
    positionPied.x, positionPied.y-tangente, positionPied.x, positionPied.y);

    // Dessine les pieds
    fill(0);
    ellipse(positionPied.x, positionPied.y, 3, 3);

    if (action) {
      changePlace();
    }
  }

  void initDeplacement() {
    action = true;

    // Définie une nouvelle position pour le pied
    detinationPied = new PVector(mouseX+bruit(valBruit), mouseY+bruit(valBruit)+tangente);

    // Détermine le vecteur qui part de la position actuelle 
    // et arriver à la nouvelle position
    trajet = PVector.sub(detinationPied, positionPied);

    // Détermine la vitesse comme fraction du trajet
    vitesse = PVector.div(trajet, 10);
  }

  void changePlace() {
    
//    checkEdges();

    // Si la distance à parcourir n'est pas nulle...
    if (positionPied.dist(detinationPied) > 0.1) {
      // ... le pied se déplace
      positionPied.add(vitesse);
    }
    else {
      // ... sinon la fonction n'est plus appelée
      action = false;
    }
  }

  int bruit(int val) {
    return(int(random(val)-val/2));
  }
   
}


