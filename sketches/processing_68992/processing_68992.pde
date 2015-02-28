
/************************
 Deux Bouttons
 Par Simon Gauthier
 UQAM 2012    EDM4600
*************************/
// Sources des inspirations et des exemples utilisés sont de provenance de Thomas O. Fredericks à l'adresse www.openprocessing.org/classroom/1228

//Déclaration des variables
float x = 200;
float y = 200;
float d = 50;
float targetX = 200;
float targetY = 200;
float pupilleD = 20;

//fonction de départ
void setup() {
  size(400,400);
  smooth();
  noStroke();
}
   
   //dessin de l'ellipse et du background
void draw() {
  background(0);
  fill(255);
   
  ellipse(x,y,d,d);
    
    //calcul des distances 
  float radians = atan2(mouseY-y,mouseX-x);
  float distance = dist(mouseX,mouseY,x,y);
   
   //restriction
  distance = constrain(distance,0,d/2 - pupilleD/2);
   
   
  float pupilleX = cos(radians)* distance + x;
  float pupilleY = sin(radians)* distance + y;
    
  fill(0);
  ellipse(pupilleX,pupilleY,pupilleD,pupilleD);
  
  //vitesse 
 x = (targetX - x) * 0.04 + x;
 y = (targetY - y) * 0.04 + y;  
   
  }
  
      
    //action à faire lors de clic de souris
void mousePressed() {
 targetX = mouseX;
 targetY = mouseY;
}

//SG 2012
