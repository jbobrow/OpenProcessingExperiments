
//////////////////////////////////////////////////////////
// 
// Travail 3 - Jeu
// Par Marc-André Brault - BRAM063118203
// EDM4600 - UQAM 2012
//
// Merci au professeur Thomas 0uellet Fredericks pour la coquille du jeu
//
//////////////////////////////////////////////////////////

int nbVies = 5;
int score = 0;

// Variables voitures groupe 1

ArrayList tVoitures1;
int nbVoitures1 = 5;
int hauteurGroupe1 = 302;
int distance1=-30;
color couleur1= color(0, 0, 255);
int ecart1 = 120;

// Variables voitures groupe 2

ArrayList tVoitures2;
int nbVoitures2 = 5;
int hauteurGroupe2 = 277;
int distance2 =430;
color couleur2 = color(124, 252, 0);
int ecart2 = 120;

// Variables voitures groupe 3

ArrayList tVoitures3;
int nbVoitures3 = 5;
int hauteurGroupe3 = 252;
int distance3 = -30;
color couleur3 = color(255, 255, 0);
int ecart3 = 120;

// Variables voitures groupe 4

ArrayList tVoitures4;
int nbVoitures4 = 5;
int hauteurGroupe4 = 227;
int distance4 =430;
color couleur4 = color(255, 160, 122);
int ecart4 = 120;

// Variables voitures groupe 5

ArrayList tVoitures5;
int nbVoitures5 = 5;
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
int nbBillots8 = 5;
int hauteurGroupe8 = 102;
int distance8 =430;
color couleur8 = color(80, 160, 200);
int ecart8 = 120;

// Variables tortues groupe 9

ArrayList tTortues9;
int nbTortues9 = 5;
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
ArrayList tIles;
int nbIles = 5;
int hauteurIle = 27;
color couleurIle = color(124, 252, 0);
int distanceIle = 49;
int ecartIle = 49;

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

  // Setup iles

  tIles = new ArrayList();

  for (int i=0 ; i < nbIles ; i++) {
    Ile b = new Ile(distanceIle, hauteurIle, couleurIle);
    tIles.add(b);
    distanceIle+=(ecartIle+21);
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

void dessinerRiviere() {
  fill(0, 0, 205);
  rect(0, 0, width, 175); // Safe zone du bas
}

void dessinerIles() {
  // Dessiner iles
  for (int k=0 ; k < tIles.size() ; k++) { 
    Ile b = (Ile) tIles.get(k);
    b.dessinerIle();
  }
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
  dessinerRiviere();
  dessinerIles();
  dessinerGroupe1();
  dessinerGroupe2();
  dessinerGroupe3();
  dessinerGroupe4();
  dessinerGroupe5();
  dessinerGroupe6();
  dessinerGroupe7();
  dessinerGroupe8();
  dessinerGroupe9();
  dessinerGroupe10();  
  dessinerSafeZones();
  dessinerPerso();  
  
  Perso b = (Perso) tPersos.get(0);
  
  if (keyPressed) {
    if (key == 'w') {
      b.bougerHaut();
    }else if (key == 'a'){
      b.bougerGauche();
    }else if (key == 's'){
      b.bougerBas();
    }else if (key == 'd'){
      b.bougerDroite();
    }
  }

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
  }else if ( nbVies <= 0 ) { // Si le nombre de vies est a zero
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
  for (int i = 0; i < tVoitures1.size(); i++ ) {
    Perso c = (Perso) tPersos.get(0);
    Voiture1 d = (Voiture1) tVoitures1.get(i);    
    float distance = dist(c.x, c.y, d.x, d.y);
    if ( distance < 21 ) {
      //println("hit");
      c.x = 190;
      c.y = 327;
      nbVies-=1;
    }
  }
  
  for (int i = 0; i < tVoitures2.size(); i++ ) {
    Perso e = (Perso) tPersos.get(0);
    Voiture2 f = (Voiture2) tVoitures2.get(i);    
    float distance = dist(e.x, e.y, f.x, f.y);
    if ( distance < 21 ) {
      //println("hit");
      e.x = 190;
      e.y = 327;
      nbVies-=1;
    }
  }
  
  for (int i = 0; i < tVoitures3.size(); i++ ) {
    Perso g = (Perso) tPersos.get(0);
    Voiture3 h = (Voiture3) tVoitures3.get(i);    
    float distance = dist(g.x, g.y, h.x, h.y);
    if ( distance < 21 ) {
      //println("hit");
      g.x = 190;
      g.y = 327;
      nbVies-=1;
    }
  }
  
  for (int i = 0; i < tVoitures4.size(); i++ ) {
    Perso z = (Perso) tPersos.get(0);
    Voiture4 j = (Voiture4) tVoitures4.get(i);    
    float distance = dist(z.x, z.y, j.x, j.y);
    if ( distance < 21 ) {
      //println("hit");
      z.x = 190;
      z.y = 327;
      nbVies-=1;
    }
  }
  
  for (int i = 0; i < tVoitures5.size(); i++ ) {
    Perso k = (Perso) tPersos.get(0);
    Voiture5 l = (Voiture5) tVoitures5.get(i);    
    float distance = dist(k.x, k.y, l.x, l.y);
    if ( distance < 21 ) {
      //println("hit");
      k.x = 190;
      k.y = 327;
      nbVies-=1;
    }
  }
}


// Executer et dessiner la fin.
void fin() {
  // Titre du jeu
  textAlign(CENTER);
  textSize(48);
  fill(255);
  text("GAME OVER", width/2, height/2);
  
  
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

  float largeur = 30;
  float hauteur = 21;
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
  }
}

class Voiture2 {

  // Attributs
  float x;
  float y;
  color c;

  float v = -1; // vitesse

  float largeur = 30;
  float hauteur = 21;
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
  }
}

class Voiture3 {

  // Attributs
  float x;
  float y;
  color c;

  float v = 1.5; // vitesse

  float largeur = 30;
  float hauteur = 21;
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
  }
}

class Voiture4 {

  // Attributs
  float x;
  float y;
  color c;

  float v = -1; // vitesse

  float largeur = 30;
  float hauteur = 21;
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
  }
}

class Voiture5 {

  // Attributs
  float x;
  float y;
  color c;

  float v = 1; // vitesse

  float largeur = 30;
  float hauteur = 21;
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
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
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
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
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
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
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
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
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
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
  float rayon = 5;

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


    noStroke();
    fill(c);
    // Carosserie
    rect(x, y, largeur, hauteur);
    // Cabine
    //rect( x+largeur/2-5, y-10, 10, 10 );
    // Roues
    //ellipse( x+rayon, y+hauteur+rayon, rayon*2, rayon*2 );
    //ellipse( x+largeur-rayon, y+hauteur+rayon, rayon*2, rayon*2 );
  }
}

class Ile {

  // Attributs
  float x;
  float y;
  color c;

  float largeur = 21;
  float hauteur = 21;  

  // Constructeur
  Ile(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  // Méthodes
  void dessinerIle() {    
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
  
  void bougerHaut(){
    y-=1;
    score++;
  }
  
  void bougerGauche(){
    x-=1;
    score++;
  }
  
  void bougerBas(){
    y+=1;
    score++;
  }
  
  void bougerDroite(){
    x+=1;
    score++;
  }
}


