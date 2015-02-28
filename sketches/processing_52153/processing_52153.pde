
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
 // noLoop();
  noFill();
}
// global settings
int squareSize = 40;
int squareNum = 28;
float angle = 0.0;
float x,y;

void draw() { 

  // incremental square
  if (frameCount < squareNum) {
         x = 200 + random(100);
         y = random(100);
         squareSize+=5;  
         rect(x,y,random(squareSize/5),random(squareSize*3));
 }
}

