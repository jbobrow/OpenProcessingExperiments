
//Anne Lagacé
//Oeil Travail de rattrapage



///////////////////////////////////////////////////////////// variables ///
 
float x = 200;
float y = 200;
 
float oeilD = 100;
float pupilleD = 30;
 
float cibleX;
float cibleY;
 
float vitesse = 5;
 
///////////////////////////////////////////////////////////// void setup ///
 
void setup() {
  size(400, 400);
  smooth();
  noStroke();
}
 
///////////////////////////////////////////////////////////// void draw ///
 
void draw() {
  background(0);
  fill(255);
 
  stroke(0);
 
  ellipse(x, y, oeilD, oeilD);     // position et diamètre oeil
 
  x = (cibleX - x ) * 0.1 + x;    // amortissement
  y = (cibleY - y ) * 0.1 + y;    // amortissement
 
  float radians = atan2(mouseY-y, mouseX-x);    // direction du radian
  float distance = dist(mouseX, mouseY, x, y);    // distance (rayon) entre la souris et l'oeil
 
  distance = constrain(distance, 0, oeilD/2 - pupilleD/2);    // contraindre la position de la pupille
 
 
  float pupilleX = cos(radians)* distance + x;    // position de la pupille X
  float pupilleY = sin(radians)* distance + y;    // position de la pupille Y
 
  fill(0);
  ellipse (pupilleX, pupilleY, pupilleD, pupilleD);    // position et diamètre Pupille
 
}
 
///////////////////////////////////////////////////////////// void mouse ///
 
 
void  mousePressed () {
 
  cibleX = mouseX ;
  cibleY = mouseY ;
}
