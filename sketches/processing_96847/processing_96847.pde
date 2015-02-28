
balle balle1;
raquette raquette1;
brique brique1;

float i=5;                // vitese de la balle en X
int u=5;                  // vitesse de la balle en Y
float balleX = 300;       // position de la balle en X au départ
float balleY = 50;        // position de la balle en Y au départ
float raquetteX = 0;      // position de la raquette de départ
int compteur ;            // valeur du score
int a=0;                  // état du jeu (cliquez pour commencer, mort...)

void setup() {
  size(600, 600);              // taille de la fenêtre
  smooth();
  frameRate(60);               // image par seconde
  background(0);
  balle1 = new balle();        // création des différents classes
  raquette1 = new raquette();
  brique1 = new brique();
}

void start() {
  brique1 = new brique();
}

void splash(int y, String message) {
  PFont font;
  font = loadFont("./EnduroDos-48.vlw"); 
  textFont(font, 48); 
  fill(255);
  text(message, 80, y);
}

void draw() {

  background(0);
  color(255, 0, 0);
  if (a==0) {        // a est initialisé à 0 donc affiche l'image au début
    PFont font;
    font = loadFont("./EnduroDos-48.vlw"); 
    textFont(font, 50); 
    fill(255);
    textAlign(CENTER);
    text("Cliquez pour" + "\n \n" +  "commencer !", 300, 200);           // SCORE
    loop();
  }
  if (mousePressed) {
    a=1;
  }

  if (keyPressed) {
    if (key == 'r' || key == 'R') {
      a=4;
    }
  }
    if (a==1) {     // si on appuie sur la souris le jeu commence, on lance les différentes fonctions des classes
      balle1.affichageballe();
      brique1.affichagebrique();
      balle1.mouvement();
      raquette1.affichage();
      brique1.rebondbrique();
    }
    else if (a==2) {                   // si la position de la balle en Y > 600 gameover
      PFont font;
      font = loadFont("./EnduroDos-48.vlw"); 
      textFont(font, 39.5); 
      fill(255);
      textAlign(CENTER);
      text(" Vous etes mort ! \n \n \n Appuyez sur \n \n  R pour \n \n recommencer" + "\n", 300, 200);
    }
    else if (a==4) {                  // si on appuie sur R, on relance le jeu
      setup();
      a=1;
    }
}
class balle {  

  float i;
  float u;
  float balleX;
  float balleY;
  float raquetteX;
  int compteur;
  PImage balle;


  balle () {
    i=5;       // vitesse de la balle en X
    u=5;       // vitesse de la balle en Y
    balleX=balleX;      //position de la balle en X
    balleY=balleY;      //position de la balle en Y
    raquetteX=300;      
    compteur = 0;
    balle = loadImage("balle.png");
  }

  void affichageballe() {
    image(balle, balleX, balleY);      // création de la balle
    raquetteX = mouseX;
    PFont font;
    font = loadFont("./EnduroDos-48.vlw"); 
    textFont(font, 12); 
    fill(255);
    text("Score : "+ brique1.compteur, 480, 30 );           // Affichage du score
  }


  void mouvement() {
    balleX = balleX+i;
    balleY = balleY+u;
    while (balleX > 595) { // mur droit
      i=-i;
      balleX=balleX+i;
    }
    while (balleX < 5) { // mur gauche
      i=-i;
      balleX=balleX+i;
    }  
    if (balleY > 545 && balleY < 555 && balleX < raquetteX+100 && balleX > raquetteX) {             // rebond sur la raquette
      u=-5;
      if ((balleX-raquetteX) > 50) {             // partie droite de la raquette
        i=(balleX-raquetteX)/10;
        balleX=balleX+i;
      }
      while (balleX < 5) {
        i=i;
        balleX=balleX+i;
      }
      if ((balleX-raquetteX) < 50 && (balleX-raquetteX) < 80  ) {           // partie gauche de la raquette
        i=-(balleX-raquetteX)/10;      // rebond
      }
      if ((balleX-raquetteX) < 80 &&  (balleX-raquetteX) < 100) {           // partie bout gauche de la raquette
        i=-(balleX-raquetteX)/5;        // rebond
      }
    }   

    else if (balleY == 5) { // mur haut
      u=5;
      balleY=balleY+u;
    }
    else if (balleY == 600) { // vide
      a=2;
    }
  }
}

class brique {

  float briqueX;
  float briqueY;
  int compteur;
  float randomX;
  float randomY;  
  boolean collision;
  PImage brique;
  
  brique() {
    briqueX=randomX;     
    briqueY=randomY;      
    compteur=0;
    randomX=random(75, 525);      // création d'une position aléatoire pour la position X de la brique
    randomY=random(30, 350);      // création d'une position aléatoire pour la position Y de la brique
    collision = false;        // état de la collision
    brique = loadImage("brique.png");
  }


  void affichagebrique() {
    briqueX= randomX;
    briqueY= randomY;
    image(brique, briqueX, briqueY);
    color(255);
  }
  
    void rebondbrique() {
    if (balle1.balleY > briqueY && balle1.balleY < briqueY+30 && balle1.balleX < briqueX+80 && balle1.balleX > briqueX) { 
      compteur = compteur+1;        // incrémentation du score
      println(compteur);
      collision = true;      //passage de la collision à l'état "true" s'il y a un rebond
    }
    else {
      collision = false;    //false tant qu'il  n'y a pas de collision
    }
    if (collision == true) {    //reset de la position de la brique
      balle1.balleY=balle1.balleY+u;  // posistion de la balle
      balle1.u=-u;      //on change la vitesse de la balle
      reset();
    }
  }

  void reset() {
    randomX=random(75, 525);
    randomY=random(30, 350);
  }
}
class raquette {

  float raquetteX;
  int tailleraquette;
  PImage raquette;
  
  raquette() {
    raquetteX = 0;
    tailleraquette = 100;
    raquette = loadImage("test.png");
  }

  void affichage() {
    raquetteX = mouseX;        // position de la raquette en X
    image(raquette, raquetteX, 550);
  }
}


