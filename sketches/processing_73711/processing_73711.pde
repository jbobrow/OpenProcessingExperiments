
//////////////////////////////////////////////////////////
// 
// Travail 3 - Jeu
// Par Marc-André Brault - BRAM063118203
// EDM4600 - UQAM 2012
//
// Merci au professeur Thomas 0uellet Fredericks pour la coquille du jeu
//
//////////////////////////////////////////////////////////

// Variables diverses

int nbVies = 5;
int score = 0;
boolean victoire = false;
boolean flotte = false;

// Images

PImage voiture_1;
PImage voiture_2;
PImage voiture_3;
PImage voiture_4;
PImage voiture_5;
PImage tortue;
PImage billot;

// Variables voitures groupe 1

ArrayList tVoitures1;
int nbVoitures1 = 3;
int hauteurGroupe1 = 302;
int distance1=-30;
color couleur1= color(0, 0, 255);
int ecart1 = 120;

// Variables voitures groupe 2

ArrayList tVoitures2;
int nbVoitures2 = 4;
int hauteurGroupe2 = 277;
int distance2 =430;
color couleur2 = color(124, 252, 0);
int ecart2 = 120;

// Variables voitures groupe 3

ArrayList tVoitures3;
int nbVoitures3 = 3;
int hauteurGroupe3 = 252;
int distance3 = -30;
color couleur3 = color(255, 255, 0);
int ecart3 = 120;

// Variables voitures groupe 4

ArrayList tVoitures4;
int nbVoitures4 = 4;
int hauteurGroupe4 = 227;
int distance4 =430;
color couleur4 = color(255, 160, 122);
int ecart4 = 120;

// Variables voitures groupe 5

ArrayList tVoitures5;
int nbVoitures5 = 3;
int hauteurGroupe5 = 202;
int distance5 = -30;
color couleur5 = color(255, 165, 0);
int ecart5 = 120;

// Variables tortues groupe 6

ArrayList tTortues6;
int nbTortues6 = 5;
int hauteurGroupe6 = 152;
int distance6 = -30;
color couleur6 = color(255, 108, 45);
int ecart6 = 120;

// Variables billots groupe 7

ArrayList tBillots7;
int nbBillots7 = 5;
int hauteurGroupe7 = 127;
int distance7 =430;
color couleur7 = color(80, 160, 200);
int ecart7 = 120;

// Variables billots groupe 8

ArrayList tBillots8;
int nbBillots8 = 3;
int hauteurGroupe8 = 102;
int distance8 =430;
color couleur8 = color(80, 160, 200);
int ecart8 = 120;

// Variables tortues groupe 9

ArrayList tTortues9;
int nbTortues9 = 4;
int hauteurGroupe9 = 77;
int distance9 = -30;
color couleur9 = color(255, 108, 45);
int ecart9 = 120;

// Variables billots groupe 10

ArrayList tBillots10;
int nbBillots10 = 5;
int hauteurGroupe10 = 52;
int distance10 =430;
color couleur10 = color(80, 160, 200);
int ecart10 = 120;

// Variables iles
ArrayList tNenuphares;
int nbNenuphares = 5;
int hauteurNenuphare = 27;
color couleurNenuphare = color(124, 252, 0);
int distanceNenuphare = 49;
int ecartNenuphare = 49;

// Variables eau

ArrayList tEau;
int nbEau = 1;
color couleurEau = color(0, 0, 255);

// Variables perso

ArrayList tPersos;
int nbPersos = 1;
color couleurPerso = color(218, 112, 214);

// Constantes d'etat.
static final int INTRODUCTION = 0;
static final int JEU = 1;
static final int FIN = 2;
static final int CONCLUSION = 3;

// Variable pour la gestion des etats.
int etat = INTRODUCTION;

// Gestion du temps.
int millisDebutJeu; // Le moment lorsque commence le jeu.
int millisDebutFin; // Le moment lorsque commence la fin.

void setup() {
  size(400, 400);
  smooth();

  // Setup images
  
  voiture_1 = loadImage("voiture_1.png");
  voiture_2 = loadImage("voiture_2.png");
  voiture_3 = loadImage("voiture_3.png");
  voiture_4 = loadImage("voiture_4.png");
  voiture_5 = loadImage("voiture_5.png");
  tortue = loadImage("tortue.png"); 
  billot = loadImage("billot.png"); 

  // Setup voitures groupe 1

  tVoitures1 = new ArrayList();

  for (int i=0 ; i < nbVoitures1 ; i++) {
    Voiture1 b = new Voiture1(distance1, hauteurGroupe1, couleur1);
    tVoitures1.add(b);
    distance1+=ecart1;
  }

  // Setup voitures groupe 2

  tVoitures2 = new ArrayList();

  for (int i=0 ; i < nbVoitures2 ; i++) {
    Voiture2 b = new Voiture2(distance2, hauteurGroupe2, couleur2);
    tVoitures2.add(b);
    distance2-=ecart2;
  }

  // Setup voitures groupe 3

  tVoitures3 = new ArrayList();

  for (int i=0 ; i < nbVoitures3 ; i++) {
    Voiture3 b = new Voiture3(distance3, hauteurGroupe3, couleur3);
    tVoitures3.add(b);
    distance3+=ecart3;
  }

  // Setup voitures groupe 4

  tVoitures4 = new ArrayList();

  for (int i=0 ; i < nbVoitures4 ; i++) {
    Voiture4 b = new Voiture4(distance4, hauteurGroupe4, couleur4);
    tVoitures4.add(b);
    distance4-=ecart4;
  }

  // Setup voitures groupe 5

  tVoitures5 = new ArrayList();

  for (int i=0 ; i < nbVoitures5 ; i++) {
    Voiture5 b = new Voiture5(distance5, hauteurGroupe5, couleur5);
    tVoitures5.add(b);
    distance5+=ecart5;
  }

  // Setup tortues groupe 6

  tTortues6 = new ArrayList();

  for (int i=0 ; i < nbTortues6 ; i++) {
    Tortue6 b = new Tortue6(distance6, hauteurGroupe6, couleur6);
    tTortues6.add(b);
    distance6+=ecart6;
  }

  // Setup billots groupe 7

  tBillots7 = new ArrayList();

  for (int i=0 ; i < nbBillots7 ; i++) {
    Billot7 b = new Billot7(distance7, hauteurGroupe7, couleur7);
    tBillots7.add(b);
    distance7-=ecart7;
  }

  // Setup billots groupe 8

  tBillots8 = new ArrayList();

  for (int i=0 ; i < nbBillots8 ; i++) {
    Billot8 b = new Billot8(distance8, hauteurGroupe8, couleur8);
    tBillots8.add(b);
    distance8-=ecart8;
  }

  // Setup tortues groupe 9

  tTortues9 = new ArrayList();

  for (int i=0 ; i < nbTortues9 ; i++) {
    Tortue9 b = new Tortue9(distance9, hauteurGroupe9, couleur9);
    tTortues9.add(b);
    distance9+=ecart9;
  }

  // Setup billots groupe 10

  tBillots10 = new ArrayList();

  for (int i=0 ; i < nbBillots10 ; i++) {
    Billot10 b = new Billot10(distance10, hauteurGroupe10, couleur10);
    tBillots10.add(b);
    distance10-=ecart10;
  }

  // Setup nenuphares

  tNenuphares = new ArrayList();

  for (int i=0 ; i < nbNenuphares ; i++) {
    Nenuphare b = new Nenuphare(distanceNenuphare, hauteurNenuphare, couleurNenuphare);
    tNenuphares.add(b);
    distanceNenuphare+=(ecartNenuphare+21);
  }

  // Setup perso

  tPersos = new ArrayList();

  for (int i=0 ; i < nbPersos ; i++) {
    Perso b = new Perso(190, 327, couleurPerso);
    tPersos.add(b);
  }
}

void draw() {
  // Executer le code approprie selon l'etat.
  if ( etat == INTRODUCTION ) {
    introduction();
  } 
  else if ( etat == JEU) {
    jeu();
  } 
  else if ( etat == FIN) {
    fin();
  } 
  else {
    conclusion();
  }
}

// Aiguiller la reaction a un clique selon l'etat.
void mousePressed() {

  if ( etat == INTRODUCTION ) {
    // Si on est a l'introduction, activer le jeu
    // et memoriser le moment lorsqu'il commence.
    etat = JEU;
    millisDebutJeu = millis();
    nbVies = 5;
    victoire = false;
  } 
  else if ( etat == JEU) {
    // Rien
  } 
  else if ( etat == FIN) {
    // Rien faire pour l'animation de la fin.
  } 
  else {
    // Si on est a la conclusion, redemarrer.
    etat = INTRODUCTION;
  }
}

// Executer et dessiner l'introduction.
void introduction() {
  background(255);

  // Titre du jeu
  textAlign(CENTER);
  textSize(48);
  fill(0);
  text("PROGGER", width/2, 100);

  // Sous-titre
  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("(Hommage à Frogger)", width/2, 140);

  // Instructions
  textAlign(CENTER);
  textSize(16);
  fill(0);
  text("Instructions :", width/2, 200);

  textAlign(CENTER);
  textSize(16);
  fill(0);
  text("Utiliser les touches W,A,S,D pour vous déplacer", width/2, 225);

  textAlign(CENTER);
  textSize(16);
  fill(0);
  text("Éviter les voitures et franchissez la rivière", width/2, 250);

  textAlign(CENTER);
  textSize(16);
  fill(0);
  text("Montez sur les nénuphares", width/2, 275);

  // Cliquez pour commencer
  textAlign(CENTER);
  textSize(24);
  fill(0);
  text("Cliquez pour commencer", width/2, 350);
}

void dessinerGroupe1() {
  // Dessiner voitures groupe 1
  for (int k=0 ; k < tVoitures1.size() ; k++) { 
    Voiture1 b = (Voiture1) tVoitures1.get(k);
    b.dessinerVoiture();
  }
}

void dessinerGroupe2() {
  // Dessiner voitures groupe 2
  for (int k=0 ; k < tVoitures2.size() ; k++) { 
    Voiture2 b = (Voiture2) tVoitures2.get(k);
    b.dessinerVoiture();
  }
}

void dessinerGroupe3() {
  // Dessiner voitures groupe 3
  for (int k=0 ; k < tVoitures3.size() ; k++) { 
    Voiture3 b = (Voiture3) tVoitures3.get(k);
    b.dessinerVoiture();
  }
}

void dessinerGroupe4() {
  // Dessiner voitures groupe 4
  for (int k=0 ; k < tVoitures4.size() ; k++) { 
    Voiture4 b = (Voiture4) tVoitures4.get(k);
    b.dessinerVoiture();
  }
}

void dessinerGroupe5() {
  // Dessiner voitures groupe 5
  for (int k=0 ; k < tVoitures5.size() ; k++) { 
    Voiture5 b = (Voiture5) tVoitures5.get(k);
    b.dessinerVoiture();
  }
}

void dessinerGroupe6() {
  // Dessiner tortues groupe 6
  for (int k=0 ; k < tTortues6.size() ; k++) { 
    Tortue6 b = (Tortue6) tTortues6.get(k);
    b.dessinerTortue();
  }
}

void dessinerGroupe7() {
  // Dessiner billots groupe 7
  for (int k=0 ; k < tBillots7.size() ; k++) { 
    Billot7 b = (Billot7) tBillots7.get(k);
    b.dessinerBillot();
  }
}

void dessinerGroupe8() {
  // Dessiner billots groupe 8
  for (int k=0 ; k < tBillots8.size() ; k++) { 
    Billot8 b = (Billot8) tBillots8.get(k);
    b.dessinerBillot();
  }
}

void dessinerGroupe9() {
  // Dessiner tortues groupe 9
  for (int k=0 ; k < tTortues9.size() ; k++) { 
    Tortue9 b = (Tortue9) tTortues9.get(k);
    b.dessinerTortue();
  }
}

void dessinerGroupe10() {
  // Dessiner billots groupe 10
  for (int k=0 ; k < tBillots10.size() ; k++) { 
    Billot10 b = (Billot10) tBillots10.get(k);
    b.dessinerBillot();
  }
}

void dessinerNenuphares() {
  // Dessiner iles
  for (int k=0 ; k < tNenuphares.size() ; k++) { 
    Nenuphare b = (Nenuphare) tNenuphares.get(k);
    b.dessinerNenuphare();
  }
}

void dessinerEau() {
  fill(0, 0, 255);
  rect(0, 0, width, 175);
}

void dessinerSafeZones() {
  fill(0);
  rect(0, 325, width, 25); // Safe zone du bas
  rect(0, 175, width, 25); // Safe zone du milieu
}

void dessinerPerso() {  
  for (int k=0 ; k < tPersos.size(); k++) { 
    Perso b = (Perso) tPersos.get(k);
    b.dessinerPerso();
  }
}

// Executer et dessiner le jeu.
void jeu() {  
  background(105);  
  dessinerEau();
  dessinerSafeZones();  
  dessinerNenuphares();   
  dessinerGroupe6();
  dessinerGroupe7();
  dessinerGroupe8();
  dessinerGroupe9();
  dessinerGroupe10();
  dessinerPerso();  
  dessinerGroupe1();
  dessinerGroupe2();
  dessinerGroupe3();
  dessinerGroupe4();
  dessinerGroupe5();

  // Dessiner le texte "Jeu".
  //textAlign(CENTER);
  //textSize(48);
  //fill(50, 255, 50);
  //text("Jeu", width/2, height/2);

  // Afficher le temps
  textAlign(RIGHT);
  textSize(21);
  fill(0);
  text("Temps", 398, 398);


  // Calculer le temps depuis le debut du jeu
  int temps = (millis() - millisDebutJeu);
  //print(temps+",");
  //println(temps);

  // Si le temps depasse 60 secondes, passer a la fin
  // et memoriser le moment lorsqu'elle commence.  
  if ( temps >= 60000 ) {
    etat = FIN;
    millisDebutFin = millis();
  }
  else if ( nbVies <= 0 ) { // Si le nombre de vies est a zero
    etat = FIN;
    millisDebutFin = millis();
  }

  // Afficher le score
  textAlign(LEFT);
  textSize(21);
  fill(0);
  text("Score : " + score, 2, 398);

  // Afficher le nombre de vies restantes

  textAlign(LEFT);
  textSize(21);
  fill(0);
  text("Vies : " + nbVies, 2, 373);

  // La largeur de la barre de defilement est determine
  // par le temps.
  float largeur = map( temps, 0, 60000, 0, 50);
  largeur = constrain(largeur, 0, 50);
  noStroke();
  fill(255);
  rect(250, 377, largeur, 21);

  // Détection de collision
  Perso a = (Perso) tPersos.get(0);

  for (int i = 0; i < tVoitures1.size(); i++ ) {
    Voiture1 d = (Voiture1) tVoitures1.get(i);    
    float distance = dist(a.x, a.y, d.x, d.y);
    if ( distance < 21 ) {
      a.x = 190;
      a.y = 327;
      nbVies-=1;
    }
  }

  for (int i = 0; i < tVoitures2.size(); i++ ) {
    Voiture2 f = (Voiture2) tVoitures2.get(i);    
    float distance = dist(a.x, a.y, f.x, f.y);
    if ( distance < 21 ) {
      a.x = 190;
      a.y = 327;
      nbVies-=1;
    }
  }

  for (int i = 0; i < tVoitures3.size(); i++ ) {
    Voiture3 h = (Voiture3) tVoitures3.get(i);    
    float distance = dist(a.x, a.y, h.x, h.y);
    if ( distance < 21 ) {
      a.x = 190;
      a.y = 327;
      nbVies-=1;
    }
  }

  for (int i = 0; i < tVoitures4.size(); i++ ) {
    Voiture4 j = (Voiture4) tVoitures4.get(i);    
    float distance = dist(a.x, a.y, j.x, j.y);
    if ( distance < 21 ) {
      a.x = 190;
      a.y = 327;
      nbVies-=1;
    }
  }

  for (int i = 0; i < tVoitures5.size(); i++ ) {
    Voiture5 l = (Voiture5) tVoitures5.get(i);    
    float distance = dist(a.x, a.y, l.x, l.y);
    if ( distance < 21 ) {
      a.x = 190;
      a.y = 327;
      nbVies-=1;
    }
  }  

  if (a.y < 175) {
    flotte = false;
    for (int i = 0; i < tTortues6.size(); i++ ) {
      Tortue6 m = (Tortue6) tTortues6.get(i);    
      float distance = dist(a.x, a.y, m.x, m.y);
      if ( distance < 21 ) {        
        flotte = true;      
        a.x=m.x;
      }
    }  

    for (int i = 0; i < tBillots7.size(); i++ ) {
      Billot7 n = (Billot7) tBillots7.get(i);    
      float distance = dist(a.x, a.y, n.x, n.y);
      if ( distance < 21 ) {
        flotte = true;
        a.x=n.x;
      }
    }  

    for (int i = 0; i < tBillots8.size(); i++ ) {
      Billot8 o = (Billot8) tBillots8.get(i);    
      float distance = dist(a.x, a.y, o.x, o.y);
      if ( distance < 21 ) {
        flotte = true;
        a.x=o.x;
      }
    }  

    for (int i = 0; i < tTortues9.size(); i++ ) {
      Tortue9 p = (Tortue9) tTortues9.get(i);    
      float distance = dist(a.x, a.y, p.x, p.y);
      if ( distance < 21 ) {
        flotte = true;
        a.x=p.x;
      }
    }  

    for (int i = 0; i < tBillots10.size(); i++ ) {
      Billot10 q = (Billot10) tBillots10.get(i);    
      float distance = dist(a.x, a.y, q.x, q.y);
      if ( distance < 21 ) {
        flotte = true;
        a.x=q.x;
      }
    }

    for (int i = 0; i < tNenuphares.size(); i++ ) {
      Nenuphare r = (Nenuphare) tNenuphares.get(i);    
      float distance = dist(a.x, a.y, r.x, r.y);
      if ( distance < 21 ) {
        flotte = true;
        victoire = true;
        etat = FIN;
        millisDebutFin = millis();
      }
    }
  }
  else if (a.y > 175) {
    flotte = false;
  }

  // Si le perso touche à l'eau
  if (a.y < 175 && flotte == false) {
    a.x = 190;
    a.y = 327;
    nbVies-=1;
  }

  // Si le perso sort de l'écran
  if (a.x < 0 || a.x > width || a.y > height) {
    a.x = 190;
    a.y = 327;
    nbVies-=1;
  }

  //println(flotte);
}

void keyPressed() {
  Perso b = (Perso) tPersos.get(0);

  if (key == 'w') { // haut
    b.bougerHaut();
  }
  else if (key == 'a') { // gauche
    b.bougerGauche();
  }
  else if (key == 's') { // bas
    b.bougerBas();
  }
  else if (key == 'd') { // droite
    b.bougerDroite();
  }
}

// Executer et dessiner la fin.
void fin() {
  if (victoire == true) {
    textAlign(CENTER);
    textSize(48);
    fill(255);
    text("BRAVO!", width/2, height/2);
    textSize(24);
    text("Vous avez gagné", width/2, 250);
  }
  else {
    textAlign(CENTER);
    textSize(48);
    fill(255);
    text("GAME OVER", width/2, height/2);
  }

  // Calculer le temps depuis le debut de la fin.
  int temps = millis() - millisDebutFin;
  // Si le temps depasse 5 secondes, passer a la conclusion.
  if ( temps >= 5000 ) etat = CONCLUSION;

  // Effectuer un fondu avec ce qui
  // a ete dessiner par le jeu.
  fill(0, 5);
  rect(0, 0, width, height);
}

// Executer et dessiner la conclusion.
void conclusion() {
  background(0);

  // Dessiner le texte "Conclusion".
  textAlign(CENTER, CENTER);
  textSize(24);
  fill(255);
  text("Cliquez pour rejouer", width/2, height/2);
}

// Classes

class Voiture1 {

  // Attributs
  float x;
  float y;
  color c;

  float v = 1; // vitesse

  float largeur = 43;
  float hauteur = 21;

  // Constructeur
  Voiture1(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerVoiture() {
    x = x + v;
    if (x > width) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = -150;
      }
      else {
        x = -30;
      }
      y = hauteurGroupe1;
    }
    image(voiture_1, x, y, 43, 21);
  }
}

class Voiture2 {

  // Attributs
  float x;
  float y;
  color c;

  float v = -1; // vitesse

  float largeur = 41;
  float hauteur = 21;

  // Constructeur
  Voiture2(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerVoiture() {
    x = x + v;
    if (x < -30) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = 550;
      }
      else {
        x = 430;
      }
      y = hauteurGroupe2;
    }
    image(voiture_2, x, y, 41, 21);
  }
}

class Voiture3 {

  // Attributs
  float x;
  float y;
  color c;

  float v = 1.5; // vitesse

  float largeur = 43;
  float hauteur = 21;

  // Constructeur
  Voiture3(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerVoiture() {
    x = x + v;
    if (x > width) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = -150;
      }
      else {
        x = -30;
      }
      y = hauteurGroupe3;
    }
    image(voiture_3, x, y, 43, 21);
  }
}

class Voiture4 {

  // Attributs
  float x;
  float y;
  color c;

  float v = -1; // vitesse

  float largeur = 43;
  float hauteur = 21;

  // Constructeur
  Voiture4(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerVoiture() {
    x = x + v;
    if (x < -30) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = 550;
      }
      else {
        x = 430;
      }
      y = hauteurGroupe4;
    }
    image(voiture_4, x, y, 43, 21);
  }
}

class Voiture5 {

  // Attributs
  float x;
  float y;
  color c;

  float v = 1; // vitesse

  float largeur = 43;
  float hauteur = 21;

  // Constructeur
  Voiture5(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerVoiture() {
    x = x + v;
    if (x > width) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = -150;
      }
      else {
        x = -30;
      }
      y = hauteurGroupe5;
    }
    image(voiture_5, x, y, 43, 21);
  }
}

class Tortue6 {

  // Attributs
  float x;
  float y;
  color c;

  float v = 1; // vitesse

  float largeur = 30;
  float hauteur = 21;

  // Constructeur
  Tortue6(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerTortue() {
    x = x + v;
    if (x > width) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = -150;
      }
      else {
        x = -30;
      }
      y = hauteurGroupe6;
    }
    image(tortue, x, y, 30, 21);
  }
}

class Billot7 {

  // Attributs
  float x;
  float y;
  color c;

  float v = -1; // vitesse

  float largeur = 30;
  float hauteur = 21;

  // Constructeur
  Billot7(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerBillot() {
    x = x + v;
    if (x < -30) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = 550;
      }
      else {
        x = 430;
      }
      y = hauteurGroupe7;
    }
    image(billot, x, y, 30, 21);
  }
}

class Billot8 {

  // Attributs
  float x;
  float y;
  color c;

  float v = -2; // vitesse

  float largeur = 30;
  float hauteur = 21;

  // Constructeur
  Billot8(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerBillot() {
    x = x + v;
    if (x < -30) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = 550;
      }
      else {
        x = 430;
      }
      y = hauteurGroupe8;
    }
    image(billot, x, y, 30, 21);
  }
}

class Tortue9 {

  // Attributs
  float x;
  float y;
  color c;

  float v = 1; // vitesse

  float largeur = 30;
  float hauteur = 21;

  // Constructeur
  Tortue9(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerTortue() {
    x = x + v;
    if (x > width) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = -150;
      }
      else {
        x = -30;
      }
      y = hauteurGroupe9;
    }
    image(tortue, x, y, 30, 21);
  }
}

class Billot10 {

  // Attributs
  float x;
  float y;
  color c;

  float v = -1; // vitesse

  float largeur = 30;
  float hauteur = 21;
 
  // Constructeur
  Billot10(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerBillot() {
    x = x + v;    
    if (x < -30) {
      int chiffreRandom = int(random(1, 6));
      //print(chiffreRandom);
      if (chiffreRandom == 2) {
        x = 550;
      }
      else {
        x = 430;
      }
      y = hauteurGroupe10;
    }
    image(billot, x, y, 30, 21);
  }
}

class Nenuphare {

  // Attributs
  float x;
  float y;
  color c;

  float largeur = 21;
  float hauteur = 21;  

  // Constructeur
  Nenuphare(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerNenuphare() {    
    noStroke();
    fill(c);    
    rect(x, y, largeur, hauteur);
  }
}

class Perso {

  // Attributs
  float x;
  float y;
  color c;

  float largeur = 21;
  float hauteur = 21;  

  // Constructeur
  Perso(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerPerso() {    
    noStroke();
    fill(c);    
    rect(x, y, largeur, hauteur);
  }

  void bougerHaut() {
    y-=25;
    score+=10;
  }

  void bougerGauche() {
    x-=25;
    score+=10;
  }

  void bougerBas() {
    y+=25;
    score+=10;
  }

  void bougerDroite() {
    x+=25;
    score+=10;
  }
}


