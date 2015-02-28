
float x = 200;
float y = 50;
int back = 0;

boolean[] deplacement;

PImage start;
PImage end;
PImage perdu;
PImage auto;


// Coquille du jeu, version avec un compteur.

// Constantes d'etat.
final int INTRODUCTION = 0;
final int JEU = 1;
final int FIN = 2;
final int CONCLUSION = 3;
final int PERDU = 4;
final int FINPERDU = 5;

// Variable pour la gestion des etats.
int etat = INTRODUCTION;

// Gestion du compteur.
int compteur = 0;

// Le moment lorsque commence la fin.
int millisDebutFin;

//################################################


void setup() {
  size(400, 400);
  smooth();
  deplacement = new boolean[400];
  start = loadImage( "start.png" );
  end = loadImage( "end.png" );
  perdu = loadImage( "perdu.png" );
  auto = loadImage( "auto.png" );

}


//################################################

void draw() {
  // Executer le code approprie selon l'etat.
  if ( etat == INTRODUCTION ) {
    introduction();
  } 
  else if ( etat == JEU) {

    jeu();

    if (  deplacement[LEFT] == true)
      x = x - 1;
    if (  deplacement[RIGHT] == true) 
      x = x + 1;
    if (  deplacement[UP] == true)
      y = y - 1;
    if (  deplacement[DOWN] == true) 
      y = y + 1;


    if ( x > 198 && x < 200 && y > 0 && y < 200 )
      compteur = compteur + 1;

    float distanceInt = dist( x, y, 200, 200);
    if ( distanceInt < 129) {
      etat = FINPERDU;
      millisDebutFin = millis();
    }

    float distanceExt = dist( x, y, 200, 200);
    if ( distanceExt > 170) {
      etat = FINPERDU;
      millisDebutFin = millis();
    }
  } 

  else if ( etat == FIN) {
    fin();
  } 
  
  else if ( etat == FINPERDU) {
    fin2();
  } 

  else if (etat == PERDU) {
    perdu();
  }

  else {
    conclusion();
  }
}



//################################################


// Executer et dessiner l'introduction.
void introduction() {
  background(#92ADF5);

  image( start, 0, 0 );

  // Dessiner le texte "Introduction".
  textAlign(CENTER, CENTER);
  textSize(20);
  fill(0);
  text("UTILISEZ LES FLÈCHES" + "\n" + "POUR CONDUIRE L'AUTO À LA VICTOIRE", width/2, 40);
textSize(10);
text("APPUYEZ SUR UNE FLÈCHE POUR DÉBUTER" + "\n" + "EFFECTUEZ QUATRE TOURS",width/2, 100);
}

// Executer et dessiner le jeu.
void jeu() {


  background(39, 134, 46);

  // "Jeu".

  //course
  fill(0);
  ellipse(200, 200, 350, 350);
  fill(12, 173, 75);
  ellipse(200, 200, 250, 250);
  stroke(116, 42, 26);
  strokeWeight(2);
  line(203, 26, 203, 74);
  noStroke();

  //auto de course
  fill(255);
  imageMode(CENTER);
  image(auto, x,y);
  imageMode(CORNER);

  // Se rendre a la fin si le compte est bon
  if ( compteur >= 4 ) {
    etat = FIN;
    millisDebutFin = millis();
  }

  // La largeur de la barre de defilement est determine
  // par le compteur.
  float largeur = map( compteur, 0, 4, 0, width);
  largeur = constrain(largeur, 0, width);
  noStroke();
  fill(255);
  rect(0, width-20, largeur, 20);

  textAlign(CENTER, CENTER);
  textSize(12);
  fill(255);
  text("TOURS"+" "+compteur, 40, 25);
}


// Executer et dessiner la fin.
void fin() {

  // Calculer le temps depuis le debut de la fin.
  int temps = millis() - millisDebutFin;
  // Si le temps depasse 5 secondes, passer a la conclusion.
  if ( temps >= 5000 ) etat = CONCLUSION;

  // Effectuer un fondu avec ce qui
  // a ete dessine par le jeu.
  fill(0, 2);
  rect(0, 0, width, height);
}

// Executer et dessiner la fin en cas de perte.
void fin2() {

  // Calculer le temps depuis le debut de la fin.
  int temps = millis() - millisDebutFin;
  // Si le temps depasse 5 secondes, passer a la conclusion.
  if ( temps >= 5000 ) etat = PERDU;

  // Effectuer un fondu avec ce qui
  // a ete dessine par le jeu.
  fill(0, 2);
  rect(0, 0, width, height);
}

// Executer et dessiner la conclusion.
void conclusion() {
  background(255);

  // Dessiner le texte "Conclusion".
  textAlign(CENTER, CENTER);
  textSize(30);
  fill(0);

  image( end, 0, 0 );

  text("VOUS AVEZ GAGNEZ !", width/2, 30);
}

void perdu() {
  background(0);

  // Dessiner le texte "Conclusion".
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(255);
  text("Perdu", width/2, 130);
  x = 200;
  y = 50;

  image( perdu, 0, 0 );
}

//################################################

//La fonction qui gère si une touche à été appuyé.
void keyPressed() {


  if ( etat == INTRODUCTION ) {
    // Si on est a l'introduction, activer le jeu
    // et re-initialiser le compteur.
    etat = JEU;
    compteur = 0;
  }

  else if ( etat == JEU) {
  } 

  else if ( etat == FIN) {
    // Rien faire pour l'animation de la fin.
  } 
  else if ( etat == FINPERDU) {
    // Rien faire pour l'animation de la fin.
  } 
  else {
    // Si on est a la conclusion, redemarrer.
    etat = INTRODUCTION;
  }



  if ( key == CODED ) {
    deplacement[keyCode] = true;
  }
}

//La fonction qui gère si une touche à été relâché.

void keyReleased() {

  if ( key == CODED ) {
    deplacement[keyCode] = false;
  }
}


