
/**********************************************************************************************************
 JEUX INSPIRÉ DE L'EXAMPLE ContactRemove DANS LA LIBRAIRIE FISICA                                       **
L'objectif consiste en fait d'éviter les projectiles qui arrivent du haut, plus longtemps vous survivez **
plus vous gagnez de point. Cependant, si vous échouez, le compteur repart à zéro                        **
*********************************************************************************************************/
 //Remise temporaire. Vais essayer d'améliorer mes choses et assumerai les retards.
 
 
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
boolean restart;
PImage  perdu; 
PImage gagne; 
void setup() {
  gagne = loadImage("gagne.jpg");
  perdu = loadImage("perdu.jpg");
  size(400, 400);
  smooth();
  noCursor();
  frameRate(60);
 
  Fisica.init(this);
 
  world = new FWorld();
 
//********************Construction des classes F qui évoluent dans l'environnement***********/////
 
  //LES SPÉCIFICATION DU SOL QUI ACCEUILLE LES BOULES ET PERMET DE COMPTER LES POINTS
  sol = new FBox(500,5);
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
 
//SPÉCIFICATION QUANT A L'EMPLACEMENT DE LA PALETTE DE POINTAGE
  textFont(font);
    fill(255);
    textAlign(RIGHT, TOP);
    text(score, 60, 350);
     
     
 
  if (frameCount % 80 == 0) {
     
    //CARACTÉRISTIQUE DES CARRÉS BLANCS 
    FBox p = new FBox(10,10);
    p.setPosition(random(0+10, width-10), 50);
    p.setVelocity(10,150);
    p.setRestitution(0);
    p.setNoStroke();
    p.setFill(255);
    world.add(p);
  }
 
  //CARACTÉRISTIQUE DES BALLES ROUGES
  if (frameCount % 80 == 0) {
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

//POSITIONNEMENT DE LA PALETTE ACCEUILANT LES BALL
  sol.setPosition(200, 390);
  world.draw();
  world.step();
 
  //*******************CONDITION DE REUSSITE OU DECHEC
  //Fait en sorte que si le score du participant tombe inférieur à zéro, le jeu arrete et vous avez perdu. 
 if (score<0){
    background(perdu);
}
  if (score>100){
    background(gagne);
  }
}
 
//**************************************FORMULE POUR LOCALISER L'IMPACT ET LE FAIRE DISPARAITRE

void contactStarted(FContact c) {
     
  FBody ball = null;
  if (c.getBody1() == sol) {
    ball = c.getBody2();
  }
  else if (c.getBody2() == sol) {
    ball = c.getBody1();
  }
if (ball == null){
}
 
//Paramètre de pointage 
 score += 1 ;
 //Calcule le score en fonction des impacts de particule sur le carré pala le score diminue de 5 a chaque impact. 
  if (c.getBody1() == pala) {
    //world.remove(pala);
    //world.remove(sol);
    score = score - 5;
   }
   
   //Ce qui fais en sorte que les balles disparaissent
world.remove(ball);



}


