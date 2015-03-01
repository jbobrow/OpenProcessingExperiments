

import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 400;
float diff = 1; 


void setup() {
  size(600, 600);
  background(255);
  beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.5); 
  stroke(0, 50); 

  translate(width/2, height/2); 
  rotate(r); 

  ellipse(0, 0, x, y);
  //ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

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



