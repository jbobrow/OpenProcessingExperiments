
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
  frameRate(6);
}
// global settings
int lineNum = 100;
float angle = 0.0;
float x= 100 + random(300);
float y= 100 + random(300);
float tx,ty;

void draw() { 
  if (frameCount < lineNum) {
         tx = 100 + random(300);
         ty = 100+ random(300);
         line(x,y,tx,ty);
         x = tx;
         y = ty;
 }
 
 
}

