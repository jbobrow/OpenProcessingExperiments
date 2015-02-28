
//--------------------------------------
// computer art 2012
// by antonio at 0280.org/processing
//---------------------------------------
// Rendering and Printing 
//---------------------------------------

void setup() {
  size(500, 500);
  background(255);
  stroke(0); 
  strokeWeight(1);
  smooth();
  //noLoop();
  noFill();
  frameRate(1);
}
// global settings
int squareSize = 38;
int squareDistance = 40;
float angle = 0.0;
float randomAngle = 0;
void draw() { 

  background(255);
  angle = 0.0;
  for (int y = 30; y< height-20; y+=squareDistance) {
      for (int x = 110; x< width-100; x+=squareDistance) {
         pushMatrix();
         translate (x, y);
         angle+=0.2; // change this!

         randomAngle = random((angle*3));
         rotate(radians(randomAngle));
         rect(-squareSize/2,-squareSize/2,squareSize,squareSize);
         popMatrix();      }
 }
}

