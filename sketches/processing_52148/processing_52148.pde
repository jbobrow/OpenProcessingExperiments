
//--------------------------------------
// computer art 2012
// by antonio at 0280.org/processing
//---------------------------------------
// Rendering and Printing
//---------------------------------------

void setup() {
  size(500,500);
  background(255);
  stroke(0); 
  strokeWeight(1);
  smooth();
  noLoop();
}
// global settings
int squareSize = 35;
int squareDistance = 40;

void draw() { 
  // ciclo for 
  for (int y = 10; y< height-20; y+=squareDistance) {
      for (int x = 10; x< width-20; x+=squareDistance) {
            rect(x,y,squareSize,squareSize);
      }
 }
}

