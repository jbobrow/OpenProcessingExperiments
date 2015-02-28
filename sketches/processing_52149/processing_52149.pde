
//--------------------------------------
// computer art 2012
// by antonio at 0280.org/processing
//---------------------------------------
// Rendering and Printing
//---------------------------------------

void setup() {
  size(500,500);
  stroke(0); 
  strokeWeight(1);
  smooth();
  //noLoop();
  noFill();
}
// global settings
int squareSize = 50;
int squareDistance = 20;
float ty = 0.0;

void draw() { 
  background(255);
  
  for (int y = 100; y< height-100; y+=squareDistance) {
      for (int x = 100; x< width-80; x+=squareDistance) {
            ellipse(x,y-ty,squareSize,squareSize);
      }
 }
 for (int y = 100; y< height-100; y+=squareDistance) {
      for (int x = 100; x< width-80; x+=squareDistance) {
            ellipse(x,y+ty,squareSize,squareSize);
      }
 }
 if (ty < 100) {
      ty+=0.1;

 } else {
      ty=0;
 }
}

