
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: KIM Youngji
// ID: 201420069

float xPos = 0;
float diameter = 200;

void setup(){
  size (600,600);
  smooth ();
}
void draw(){
  background(165,0,37);  
  xPos = xPos + 5;
  if (xPos > width + diameter) {
    xPos = -diameter;
  }
  noStroke();
  fill(random(255),255,100,100);
  ellipse (height/2, xPos, diameter, diameter);
}
