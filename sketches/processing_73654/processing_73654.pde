
// Coquille du jeu, version avec un compteur.

//Variables jeu//------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Obstacles[] tableauObstacle = new Obstacles[9];
//DansTriangle dansTriangle;
Avion avion;
Compteur compteur;
Intro intro;
Fin conclusionClass;

int type;
int nombreElement;
int timestamp;
float ancienX;
float ancienY;
float animeAlpha = 255;

float px;
float py;
int nombrePomme = 0;
int nombrePoubelle= 0;

boolean afficherPointPomme = false;
PImage imgPoint;

// Constantes d'etat.
final int INTRODUCTION = 0;
final int JEU = 1;
final int FIN = 2;
final int CONCLUSION = 3;

// Variable pour la gestion des etats.
int etat = INTRODUCTION;

// Gestion du compteur.
int compteurAPlus = 0;

// Le moment lorsque commence la fin.
int millisDebutFin;

void setup() {
  size(400, 400);
  smooth();
  intro = new Intro();
  compteur = new Compteur();
  conclusionClass = new Fin();

  nombreElement = 1;
  for (int i = 0; i < tableauObstacle.length; i++ ) {
    if ( i <= 2 ) {
      tableauObstacle[i] = new Obstacles(1, 2);
    }
    else if ( i <= 5 && i > 2 ) {
      tableauObstacle[i] = new Obstacles(2, 2);
    }
    else if (i <= 8 && i > 5) {
      tableauObstacle[i] = new Obstacles(3, 2);
    }
  }

  avion = new Avion();
  //  dansTriangle = new DansTriangle();
}


void draw() { //------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
void mousePressed() { //------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  if ( etat == INTRODUCTION ) {
    // Si on est a l'introduction, activer le jeu
    // et re-initialiser le compteur.
  } 
  else if ( etat == JEU) {
    // Le jeu: dans cet exemple tres simple
    // le compteur incremente
    // lorsque l'interacteur clique.
    // compteurAPlus = compteurAPlus + 1;
  } 
  else if ( etat == FIN) {
    // Rien faire pour l'animation de la fin.
  } 
  else {
    avion.y = 200;
    avion.desactiveClic = false;
    millisDebutFin = 0;
    timestamp = 0;
    nombrePomme = 0;
    nombrePoubelle= 0;
    compteurAPlus = 0;
    for (int y = 0; y < tableauObstacle.length; y++ ) {
      tableauObstacle[y].vitesseAjoute = 0;
    }

    for (int i = 0; i < tableauObstacle.length; i++ ) {
      tableauObstacle[i].x[0] = random(width, width*2);
      tableauObstacle[i].y[0] = random(36, 312);
    }
    etat = JEU;
  }
}


// Executer et dessiner l'introduction.
void introduction() {//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  background(255);
  intro.draw();
  intro.spaceBarAction();
}

// Executer et dessiner le jeu.
void jeu() {//------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  background(128);

  if ( compteurAPlus >= 4 ) {// Achanger
    etat = FIN;
    timestamp = millis();
  }

  tint(255, 255);
  background(0);
  avion.draw();  
  compteur.draw(nombrePomme, nombrePoubelle);

  for (int i = 0; i < tableauObstacle.length; i++ ) {
    tableauObstacle[i].draw(); 
    px = tableauObstacle[i].x[0];
    py = tableauObstacle[i].y[0];

    if (px>=70 && px<=145 && py>=avion.y && py<= avion.y+25) {
      //HIT LA POUBELLE
      if ( i <= 2 ) {                              
        tableauObstacle[i] = new Obstacles(1, 2);
        nombrePoubelle ++;
      }
      //HIT UNE POMME
      else if ( i <= 5 && i > 2 ) {          
        ancienX = tableauObstacle[i].x[0];
        ancienY = tableauObstacle[i].y[0];
        nombrePomme ++;
        afficherPointPomme = true;
        tableauObstacle[i] = new Obstacles(2, 2);
      }
      //HIT UN PAPIER
      else if (i <= 8 && i > 5) {       
        for (int y = 0; y < tableauObstacle.length; y++ ) {
          tableauObstacle[y].vitesseAjoute += 0.5;
        }
        tableauObstacle[i] = new Obstacles(3, 2);
      }
    }
    else {
    }
  }
  if (afficherPointPomme == true) {
    afficherImagePoint();
  }
}
void afficherImagePoint() {//------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  tint(255, animeAlpha);
  imgPoint = loadImage("pointajoute.png");
  image(imgPoint, ancienX, ancienY, 18, 18);
  animeAlpha -=10;

  if (animeAlpha <= 0) {
    afficherPointPomme = false;
    animeAlpha = 255;
  }
}

// Executer et dessiner la fin.
void fin() {//---------------------------------------------------------


  // Calculer le temps depuis le debut de la fin.
  // Si le temps depasse 3 secondes, passer a la conclusion.

 int temps = millis() - timestamp;
  
  if (temps >= 3000 ) {
    etat = CONCLUSION;
  }
    fill(0, 10);
    rect(0, 0, width, height); 

  // Effectuer un fondu avec ce qui
  // a ete dessine par le jeu.
}

// Executer et dessiner la conclusion.
void conclusion() {//---------------------------------------------------------
  background(0);
  // Dessiner le texte "Conclusion".
  conclusionClass.draw(timestamp, nombrePomme);
}

void changementEtat() { /// Ma deuxième facon de mourir
  etat=FIN;
  timestamp=millis();
}


/*
void fin() {
    
  // Calculer le temps depuis le debut de la fin.
  int temps = millis() - millisDebutFin;
  // Si le temps depasse 5 secondes, passer a la conclusion.
  if ( temps >= 5000 ) etat = CONCLUSION;
    
  // Effectuer un fondu avec ce qui
  // a ete dessine par le jeu.
  fill(0 , 2);
  rect(0,0,width,height);
    
}
*/

