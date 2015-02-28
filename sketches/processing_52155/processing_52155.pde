
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
  frameRate(120);
}
// global settings
int lineNum = 4000;
float angle = 0.0;
float x= 0;
float y= 0;
float tx,ty;
int row=50;

void draw() { 
  if (frameCount < lineNum) {
         tx += 3;
         ty = row + random(60); 
         tx -= random(5);
         if (x < width) {
           stroke(0);
         } else {
           stroke(0,0);
         tx=0;
         row+=100;
         }
         line(x,y,tx,ty);
         x = tx;
         y = ty; 
  }
}

