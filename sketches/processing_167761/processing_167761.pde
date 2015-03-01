

import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 200;
float diff = 0.2; 


void setup() {
  size(600, 600);
  background(255);
  
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.1); 
  stroke(0,120,180); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(x, y, x, 50);


  angle = angle +0.5;
  r = r - diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

