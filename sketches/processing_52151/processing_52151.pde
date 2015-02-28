
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
  noFill();
}
// global settings
int squareSize = 300;
int squareDistance = 100;
float angle = 0.0;
float randomAngle = 0;

void draw() { 
  translate (width/2, height/2);

  // ciclo for 
  for (int y = 40; y< height-20; y+=squareDistance) {
      for (int x = 40; x< width-20; x+=squareDistance) {
         pushMatrix();
         squareSize -= 10;
         randomAngle = random((angle*2)-angle);
         angle+=8; // change this!
         //rotate(radians(randomAngle));
         rect(-squareSize/2,-squareSize/2,squareSize,squareSize);
         popMatrix();      
       }
 }
}

