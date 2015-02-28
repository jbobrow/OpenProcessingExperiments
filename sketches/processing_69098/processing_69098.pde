
/* ---------------------------------------
 RattrapageA
 par
 Guillaume Perreault Roy
 
 -----------------------------------------*/

float x = 200; //Position de l'oeil x
float y = 200; //Position de l'oeil y
float d = 100; //Grosseur de l'oeil
 
float xCible = 200; //Ou va l'oeil? (quand on clique)
float yCible = 200;
float xVitesse;
float yVitesse;
float k = 0.9;
float e = 0.05;
 
float pupilleD = 30; //Grosseur de la pupille
   
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
   
   
void draw() {
  background(0);
  fill(255);
  
  
  if ( mousePressed) { // Établit la cible de l'oeil
    xCible = mouseX;
    yCible = mouseY; 
  }
  
  
  xVitesse = e * (xVitesse + k * (xCible - x)); //Calcul d'assouplissement x
  x = x + xVitesse;

  yVitesse = e * (yVitesse + k * (yCible - y)); //Calcul d'assouplissement y
  y = y + yVitesse;
  
  ellipse(x,y,d,d); //dessine l'oeil
  
    
  float radians = atan2(mouseY-y,mouseX-x); //Calcul de la direction de la souris par rapport à l'oeil
  float distance = dist(mouseX,mouseY,x,y); //Calcul de la distance entre le point central de l'oeil et la souris
   
  distance = constrain(distance,0,d/2 - pupilleD/2); //Empeche la distance de dépasser l'oeil
   
   
  float pupilleX = cos(radians)* distance + x;//Décompose l'angle pour donner la position de la pupille
  float pupilleY = sin(radians)* distance + y;
    
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD); //Dessine la pupille
   
}


