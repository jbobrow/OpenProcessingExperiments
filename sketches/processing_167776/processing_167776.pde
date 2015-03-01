

import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
  
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(#7A9A9D,50); 
  

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  line( 0, 0, x, y); 

  angle = angle +1;
  r = r - diff;

  if ( r == 0 || r == 200) { 
    diff =  diff * -1;
  }
}




