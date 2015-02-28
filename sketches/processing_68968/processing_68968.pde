

//-- déclaration des variables nécéssaire au sketch
float x = 60;
float y = 60;
float xcible = 60;
float ycible = 60;

float oeil = 100;
float rondNoir = 30;
float vitesse = 0.04;


//---SETUP
//---données de base, grandeur, anti-alias et sans bordures
void setup() {
  size(400, 400);
  smooth();
  noStroke();
}

//--DRAW
//--Section lu à chaque frame.

void draw() {
  background(0);

/*-- Création des variable qui permette de déterminer l'angle dans lequel
la souris se trouve par rapport à l'oeil et à contraindre les déplacement
de la pupille dans l'oeil.*/

  float radians = atan2(mouseY-y, mouseX-x);
  float distance = dist(mouseX, mouseY, x, y);
  distance = constrain(distance, 0, oeil/2 - rondNoir/2);


  float rondX = cos(radians)* distance + x;
  float rondY = sin(radians)* distance + y;


//-- dessine l'oeil
  fill (255);
  ellipse(x, y, oeil, oeil);

//-- dessine la pupille
  fill(0);
  ellipse(rondX, rondY, rondNoir, rondNoir);
  
  
//-- Crée une vitesse proportionnelle avec les nouvelles données en x et y
  x = (xcible - x) * vitesse + x;
  y = (ycible - y) * vitesse + y;
  
}


/* ---- Section dépendante des actions de la souris, lorsque le bouton de la
souris est pressé les variables xcbible et ycible sont actualiser avec les
coordonn.es de la souris. */

void mousePressed() {
  xcible = mouseX;
  ycible = mouseY;
}


