

import processing.pdf.*;

float x, y;
float angle = 10; 
float r = 222;
float diff = 2; 


void setup() {
  size(600, 600);
  background(255,113,113);
  beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(255, 50); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

  angle = angle +100;
  r = r - diff;

  if ( r == 0 || r == 500) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

