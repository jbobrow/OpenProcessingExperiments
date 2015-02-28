
float x, y, xCiblee=200, yCiblee=200;  //corrdoné de départ
float pupilleD = 30;  //diametre de la pupille
float d = 100;   //diametre
float facteur = 0.1;  //vitesse

  void setup() {
  size(400, 400);
  smooth();
 }
 void draw() {
 background(0);
  
  //------------------------------------------------------------------------
  //code pour faire suivre la souris une fois cliquer
  float radians = atan2( yCiblee-y, xCiblee-x );
  float distance = dist( xCiblee, yCiblee, x, y );
  x = (xCiblee - x) * facteur + x;
  y = (yCiblee - y) * facteur + y;
  //------------------------------------------------------------------
  //clacul l'angle par rapport à la souris
  radians = atan2(mouseY-y,mouseX-x);
  //------------------------------------------------------------------
  //oeuil qui suit
  //clacul la distance par rapport à la souris
  distance = dist(mouseX,mouseY,x,y);
  //------------------------------------------------------------------
  //resrain la puipille dans l'oeuil
  distance = constrain(distance,0,d/2 - pupilleD/2);
  //------------------------------------------------------------------
  //conversion de la valeur coordonné du systeme polaire en cartésien
  float pupilleX = cos(radians)* distance + x;
  float pupilleY = sin(radians)* distance + y;
 
  
 fill(255);
 ellipse(x, y,d,d);
 fill(0);

 ellipse(pupilleX,pupilleY,pupilleD,pupilleD);
  

 }
void mousePressed () {  xCiblee = mouseX;
  yCiblee = mouseY;
}
