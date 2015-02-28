

/**********************************************************************************************************
 JEUX INSPIRÉ DE L'EXAMPLE ContactRemove DANS LA LIBRAIRIE FISICA                                       **
L'objectif consiste en fait d'éviter les projectiles qui arrivent du haut, plus longtemps vous survivez **
plus vous gagnez de point. Cependant, si vous échouez, le compteur repart à zéro                        **
*********************************************************************************************************/



import fisica.*;

//DÉCLARATION DES VARIABLES

//APPORT DES CLASSES DE FISICA
FBody ball;
FWorld world;
FBox pala;
FCircle b;
FBox p;
FBox sol;

//APPORT DES DES FONCTIONS
PFont font;
int score = 0;

void setup() {
  size(400, 400);
  smooth();
  noCursor();
  frameRate(60);

  Fisica.init(this);

  world = new FWorld();

//********************Construction des classes F qui évoluent dans l'environnement***********/////

  //LES SPÉCIFICATION DU SOL QUI ACCEUILLE LES BOULES ET PERMET DE COMPTER LES POINTS
  sol = new FBox(400,5);
  sol.setPosition(width/2, height - 40);
  sol.setStatic(true);
  sol.setFill(0); //couleur de la palette
  sol.setRestitution(0);
  world.add(sol);

//LE VAISSEAU/ENTITÉ PRINCIPALE QUI SE DOIT D'ÉVITER LES PARTICULES
  pala = new FBox(40, 40);
  pala.setPosition(width/2, height - 40);
  pala.setStatic(true);
  pala.setFill(255); //couleur de la palette
  pala.setRestitution(0);
  world.add(pala);
  
  
//CHARGE LA POLICE D'ÉCRITURE  
  font = loadFont("BebasNeue-48.vlw");

}



void draw() {
  background(0);

//Recommencer le jeux, une fois l'echec arrivé. 
  if (mousePressed) {
    
      pala = new FBox(40, 40);
  pala.setPosition(width/2, height - 40);
  pala.setStatic(true);
  pala.setFill(255); //couleur de la palette
  pala.setRestitution(0);
  world.add(pala);
  }

//SPÉCIFICATION QUANT A L'EMPLACEMENT DE LA PALETTE DE POINTAGE
  textFont(font);
    fill(255);
    textAlign(RIGHT, TOP);
    text(score, 60, 350);
    
    

  if (frameCount % 50 == 0) {
    
    //CARACTÉRISTIQUE DES CARRÉS BLANCS  
    FBox p = new FBox(10,10); 
    p.setPosition(random(0+10, width-10), 50);
    p.setVelocity(0,150);
    p.setRestitution(0);
    p.setNoStroke();
    p.setFill(255);
    world.add(p);
  }

  //CARACTÉRISTIQUE DES BALLES ROUGES
  if (frameCount % 50 == 0) {
    FCircle b = new FCircle(random(7,15));
    b.setPosition(random(0+10, width-10), 0);
    b.setVelocity(0, 150);
    b.setRestitution(0);
    b.setNoStroke();
    b.setFill(205,51,51);
    world.add(b);
  }


  //POSITIONNEMENT DE LA PALETTE SUR L'AXE DES "X"  
  pala.setPosition(mouseX, height - 40);
  world.draw();
  world.step();

  sol.setPosition(200, 390);
  world.draw();
  world.step();
}


//FORMULE POUR LOCALISER L'IMPACT ET LE FAIRE DISPARAITRE
void contactStarted(FContact c) {
  
  
  
  FBody ball = null;
  if (c.getBody1() == sol) {
    ball = c.getBody2();
  } 
  else if (c.getBody2() == sol) {
    ball = c.getBody1();
  }
  

if (ball == null){
  //return 0;
}

//return score;


 // FBody cube = null;
  if (c.getBody1() == pala) {
    world.remove(pala);
    score = 0;
  
  }
  
world.remove(ball);
score += 1;

  
}





