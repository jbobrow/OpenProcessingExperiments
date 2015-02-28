
/* ************************************************************************************
   Exercice de Kim Guilbault
   Travail de rattrapage dans le cours EDM4600 
   L'oeil 
********************************************************************************************* */


// Variables globales

// Oeil et pupille
float x = 200;
float y = 200;
float pupillex = 100;
float pupilley = 100;
float diametreOeil = 100;
float diametrePupille = 30;

// Faire bouger l'oeil
float positionCibleX = 200;
float positionCibleY = 200;
float facteur = 0.1;
float vitesse = 0.1;

// Initialisation de la scène
void setup(){
  size(400,400);
  smooth();
  noStroke();
    
}

void draw(){
  // Backgound dans la fonction draw pour redessiner le fond noir lorsque l'oeil bouge
    background(0);
  
  // Faire bouger la pupille
  float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
  distance = constrain(distance,0,diametreOeil/2 - diametrePupille/2);
  pupillex = cos(radians) * distance + x;
  pupilley = sin(radians) * distance + y;
  
 
  // Faire suivre la souris
  float radiansClick = atan2( positionCibleY-y, positionCibleX-x );
  float distanceClick = dist( positionCibleX, positionCibleY, x, y );
  x = cos(radiansClick) * min(distanceClick,vitesse) + x;
  y = sin(radiansClick) * min(distanceClick,vitesse) + y;

  // Assouplissement
  x = (positionCibleX - x) * facteur + x;
  y = (positionCibleY - y) * facteur + y;
  
  
  // Dessiner les ellipses
  fill(255);
  ellipse(x,y,diametreOeil,diametreOeil);
  fill(0);
  ellipse(pupillex,pupilley,diametrePupille,diametrePupille);
}

// Au clic de la souris, l'oeil se déplace et va à la position de la souris
void mousePressed(){
    positionCibleX = mouseX;
    positionCibleY = mouseY;
}
