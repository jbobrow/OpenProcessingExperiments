
//--------------------------------------
// computer art 2012
// by antonio at 0280.org/processing
//---------------------------------------
// Rendering and Printing
//---------------------------------------

void setup() {
  size(500,500);
  background(0);
  stroke(0); 
  strokeWeight(1);
  smooth();
  //noLoop();
  frameRate(1);
}
// global settings
int squareSize = 35;
int squareDistance = 40;
float randomSize = 0.0;
float randomNum = 0.0;


void draw() { 
  // ciclo for 
  for (int y = 10; y< height-20; y+=squareDistance) {
      for (int x = 10; x< width-20; x+=squareDistance) {
         randomSize = random(squareSize);        
         fill(random(100),random(100),random(100));
         rect(x,y,randomSize,randomSize);
      }
 }
}

