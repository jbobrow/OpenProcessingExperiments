
//declaration des classes
nuage nuage_forme=new nuage(); 
neige neige_forme=new neige();
lettre lettre_affichage=new lettre();
neige r1;

//initialisation des variables
int numFlocons = 40;
neige[] Flocons = new neige[numFlocons]; //declaration tableau
float R = 0;
float G = 0;
float B = 255;
float a = random(20); 
PFont maPolice;
PImage fond;

//declaration des elements de l'animation
void setup() { 

  fond=get();
  size(500, 500);
  rectMode(CENTER);
  background(255);
  smooth();
  noStroke();

  //appel de la police
  maPolice = loadFont("TreasureIsland-48.vlw");
  textFont(maPolice);

  //creation boucle et execution
  for (int i = 0; i < Flocons.length; i++) {

    //lecture du tableau avec les flocons
    Flocons[i] = new neige(); 
    r1 = new neige();
  }
}

void draw() { 

  //appel des classes
  nuage_forme.affiche();
  lettre_affichage.affiche();
  for (int i = 0; i < Flocons.length; i++) {
    Flocons[i].affiche();
  }
  if (keyPressed) {//si j'appuie sur la barre "espace", je remet du gris dans mon dessin donc j'efface les point noir
    if (key == ' ') {
      background(255);
      fond = get();
    }
  }
  if (keyPressed) {//si j'appuie sur la touche "s", j'enregistre une capture de mon dessin.
    if (key == 's') {
      save("Capture.jpg");
    }
  }
}

class lettre {
// affichage du "Joyeux Noel" avec la police 
  lettre() {
    PFont maPolice;
  }
  void affiche() {
    fill(255);
    textSize(80);
    text("Joyeux Noel", 25, 250);
  }
}

//Dessin du nuage
class nuage {
  nuage() {
  }
  void affiche() {
    noStroke();
    fill(255);
    ellipse(140, 0, 200, 200);
    ellipse(240, 30, 250, 200);
    ellipse(340, 10, 200, 200);
    ellipse(440, -50, 200, 200);
    arc(70, 0, 200, 100, HALF_PI, PI);
  }
}

//Dessin du flocon
class neige {

  float r = random(500);
  float y = random(-height);

  //declaration du flocon
  void affiche() {
    color fondForme = color(R, G, B);
    y = y + 10;
    fill(fondForme, a);
    pushMatrix();
    translate(r, y);
    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    rotate(HALF_PI);
    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    rotate(0);
    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    rotate(HALF_PI);
    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    rotate(40);

    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    rotate(HALF_PI);
    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    rotate(0);
    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    rotate(HALF_PI);
    rect(-5, 0, 5, 0);
    for (int i=-5; i<=5; i+=1) {
      rect(i, 1, i, 1);
    }
    popMatrix();

    // conditionnement des couleurs aleatoires
    if (R>255) {
      R=0;
    }
    else {
      R++;
    }
    G = random(255);

    if (B<0) {
      B=255;
    }
    else {
      B-=0.5;
    }
    if (a<0) {
      a=255;
    }
    else {
      a-=0.5;
    }

    if (y>height) {
      r = random(600);
      y = random(-200);
    }
  }
}



