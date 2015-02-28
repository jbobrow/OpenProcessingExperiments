
/* =================================================================================
   Réalisé par Jean-François Bourbeau et Jean-Michel Leblanc dans le cadre du cours 
   d'algorithmie de base et interacgtivité (EDM4600) pour Thomas Ouellet Fredericks.
   ================================================================================= */

// ------------------------- Déclaration des variables globales -------------------------
// Variables et classes globales relative au score, aux états, etc
ArrayList tStations;
Station station;
int chronoNewStation;
final int title = 0;
final int jeu = 1;
final int gameOver = 3;
final int instructions = 4;
int etat = title;
int score_value;
int fuel = 5;
int flashGaz;
float fond_jeu = 400;
float vitesse = 1;
int frequence = 3000;
float shake_vitesse;
float posVaisseau;
int millisReset;

// Déclaration globale des images
PImage img_title;
PImage img_title_jouer;
PImage img_title_jouer_green;
PImage img_title_instructions;
PImage img_title_instructions_green;
PImage img_jeu_fond;
PImage img_jeu_cockpit;
PImage img_jeu_vaisseau;
PImage img_jeu_station;
PImage img_jeu_station_green;
PImage img_jeu_gaz5;
PImage img_jeu_gaz4;
PImage img_jeu_gaz3;
PImage img_jeu_gaz2;
PImage img_jeu_gaz1;
PImage img_jeu_gaz1flash;
PImage img_gameOver_fond;
PImage img_gameOver_recommencer;
PImage img_gameOver_recommencer_green;
PImage img_gameOver_vaisseau;
PImage img_instructions_fond;


// Déclaration des variables du centre de la scène
float positionX, positionY;

// ------------------------- Setup principal (s'éxécute une seule fois) -------------------------
void setup() {
  size(400, 400); 
  smooth();
  // Assignation de la valeur des images
  img_title = loadImage("title.jpg");
  img_title_jouer = loadImage("jouer.png");
  img_title_jouer_green = loadImage("jouer_green.png");
  img_title_instructions = loadImage("instructions.png");
  img_title_instructions_green = loadImage("instructions_green.png");
  img_jeu_fond = loadImage("jeu_fond.jpg");
  img_jeu_cockpit = loadImage("jeu_cockpit.png");
  img_jeu_vaisseau = loadImage("jeu_vaisseau.png");
  img_jeu_station = loadImage("jeu_station.png");
  img_jeu_station_green = loadImage("jeu_station_green.png");
  img_jeu_gaz5 = loadImage("jeu_gaz5.png");
  img_jeu_gaz4 = loadImage("jeu_gaz4.png");
  img_jeu_gaz3 = loadImage("jeu_gaz3.png");
  img_jeu_gaz2 = loadImage("jeu_gaz2.png");
  img_jeu_gaz1 = loadImage("jeu_gaz1.png");
  img_jeu_gaz1flash = loadImage("jeu_gaz1flash.png");
  img_gameOver_fond = loadImage("game_over.jpg");
  img_gameOver_recommencer = loadImage("recommencer.png");
  img_gameOver_recommencer_green = loadImage("recommencer_green.png");
  img_gameOver_vaisseau = loadImage("gameOver_vaisseau.png");
  img_instructions_fond = loadImage("instructions_fond.jpg");

  // Centre de la scène (compensation assouplissement) et position initiale du vaisseau qui flotte lors du game over
  positionX = width/2;
  positionY = height/2;
  posVaisseau = 30;

  // Comptage des stations d'essence
  tStations = new ArrayList();
}

// ------------------------- Vérificaton des états à chaque frame (60 fois par seconde) -------------------------
void draw() {
  // Écran titre
  if (etat == title) {
    draw_title();
  }
  // Écran jeu
  else if (etat == jeu) {
    draw_jeu();
  }
  // Écran gameOver
  else if (etat == gameOver) {
    draw_gameOver();
  }
  // Écran instructions
  else if (etat == instructions) {
    draw_instructions();
  }
}

// ------------------------- Fonctions qui dessines les différents éléments selon les états -------------------------

// Introduction
void draw_title() { 
  chronoNewStation = millis(); 
  cursor(ARROW);
  image(img_title, 0, 0);

  // Mouseover du bouton JOUER
  if (mouseX > 133 && mouseX < 273 && mouseY > 291 && mouseY < 340) { 
    image(img_title_jouer_green, 0, 0);
    if (mousePressed) {
      etat = jeu;
      mouseX = width/2;
      mouseY = height/2;
    }
  } 
  else {
    image(img_title_jouer, 0, 0);
  }

  // Mouseover du bouton INSTRUCTIONS
  if (mouseX > 133 && mouseX < 273 && mouseY > 348 && mouseY < 395) { 
    image(img_title_instructions_green, 0, 0);
    if (mousePressed) {
      etat = instructions;
      mouseX = width/2;
      mouseY = height/2;
    }
  } 
  else {
    image(img_title_instructions, 0, 0);
  }
}

// Pendant le jeu
void draw_jeu() {
  // Placement du background
  noCursor();
  imageMode(CENTER);
  image(img_jeu_fond, 200+random(-shake_vitesse, shake_vitesse), 200+random(-shake_vitesse, shake_vitesse), fond_jeu, fond_jeu);
  fond_jeu += 0.2;

  // Ajout des stations d'essence sur la scène
  if (millis() - chronoNewStation > 1000) {
    chronoNewStation = chronoNewStation + frequence;
    Station unite = new Station(random(50, 350), random(50, 300), 0);
    tStations.add(unite);
    vitesse += 0.3;
    frequence -= 70;
    shake_vitesse += 0.2;
  }

  for ( int i = 0 ; i < tStations.size() ; i++ ) {
    Station unite = (Station) tStations.get(i);
    unite.draw();
  }

  // Dessin et assouplissement du vaisseau
  positionX = (mouseX - positionX) / 7.0 + positionX;
  positionY = (mouseY - positionY) / 7.0 + positionY;
  image(img_jeu_vaisseau, positionX + random(-shake_vitesse, shake_vitesse), positionY + random (-shake_vitesse, shake_vitesse));

  // Dessin du cockpit
  imageMode(CORNER);
  image(img_jeu_cockpit, 0, 0);

  //Score
  textAlign(CORNER);
  String score = "Score: " + score_value;
  fill(255);
  text(score, 10, 20);

  // Incrémentation de score 
  score_value++;

  // Vérification de l'état du fuel
  if (fuel <= 0) {
    flashGaz = 0;
    etat = gameOver;
  }

  // Changement de l'image du fuel selon l'état
  imageMode(CENTER);

  if (fuel == 5) {
    image(img_jeu_gaz5, 203, 367);
  }
  else if (fuel == 4) {
    image(img_jeu_gaz4, 203, 367);
  }
  else if (fuel == 3) {
    image(img_jeu_gaz3, 203, 367);
  }
  else if (fuel == 2) {
    image(img_jeu_gaz2, 203, 367);
  }
  else if (fuel == 1) {
    if (flashGaz == 0) {
      image(img_jeu_gaz1, 203, 367);
      flashGaz = 1;
    } 
    else {
      image(img_jeu_gaz1flash, 203, 367);
      flashGaz = 0;
    }
  }
}

// Game Over
void draw_gameOver() {
  chronoNewStation = millis(); 
  fond_jeu = 400;
  fuel = 5;
  vitesse = 1;
  frequence = 3000;
  shake_vitesse = 0;

  imageMode(CORNER);
  image(img_gameOver_fond, 0, 0);
  image(img_gameOver_vaisseau, posVaisseau, posVaisseau);
  posVaisseau+=0.2;

  textAlign(CENTER);
  String score = "Votre score: " + score_value;
  fill(255);
  text(score, 200, 90);

  cursor(ARROW);
  // Mouseover du bouton RECOMMENCER
  if (mouseX > 133 && mouseX < 273 && mouseY > 291 && mouseY < 340) { 
    image(img_gameOver_recommencer_green, 0, 0);
    if (mousePressed) {
      etat = jeu;
      score_value = 0;
      posVaisseau = 30;
      mouseX = width/2;
      mouseY = height/2;
    }
  } 
  else {
    image(img_gameOver_recommencer, 0, 0);
  }
}

// Instructions
void draw_instructions() {
  chronoNewStation = millis(); 
  image(img_instructions_fond, 0, 0);
  // Mouseover du bouton JOUER
  if (mouseX > 133 && mouseX < 273 && mouseY > 323 && mouseY < 372) { 
    image(img_title_jouer_green, 0, 32);
    if (mousePressed) {
      etat = jeu;
    }
  } 
  else {
    image(img_title_jouer, 0, 32);
  }
}

// ------------------------- Classe des stations de rechargement d'essence -------------------------
class Station { 
  float echelle;
  float xUnite;
  float yUnite;

  Station (float xUnite, float yUnite, float grosseur) {
    echelle = grosseur; 
    this.xUnite = xUnite;
    this.yUnite = yUnite;
  }

  void draw() { 
    xUnite = xUnite + random(-shake_vitesse, shake_vitesse);
    yUnite = yUnite + random(-shake_vitesse, shake_vitesse); 

    if (echelle >= 100) {
      image(img_jeu_station_green, xUnite, yUnite, echelle, echelle);
    } 
    else {
      image(img_jeu_station, xUnite, yUnite, echelle, echelle);
    }

    if (echelle >= 170) {
      tStations.remove(this);

      if (fuel > 0) {
        fuel--;
      }
    }

    echelle += vitesse;
  }
}

// ------------------------- Permet au vaisseau de faire le plein d'essence sur un clique de souris -------------------------
void mousePressed() {
  for (int i = tStations.size() - 1; i >= 0; i--) {
    Station unite = (Station) tStations.get(i);
    float distance = dist(mouseX, mouseY, unite.xUnite, unite.yUnite);
    if (unite.echelle >= 100 && distance < unite.echelle/2) {
      tStations.remove(i);

      if (fuel < 5) {
        fuel++;
      }
    }
  }
}


