

import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 350;
float diff = 2; 


void setup() {
  size(600, 600);
  background(255);
  beginRecord(PDF, "every.pdf");
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle);

  strokeWeight(0.8); 
  stroke(1, 100); 

  translate(width/2, height/2); 
  rotate(r+30); 
  //ellipse(0, y, x, 0);
  ellipse(0, 20, x, 20);
 // ellipse(x, y, x, y);
  ellipse(5, 20, 5, 40);
 // ellipse(x, 0, x, 50);
  //line( 0, 0, x, y); 

  angle = angle +0.3;
  r = r - diff;

  if ( r == 0 || r == 250) { 
    diff =  diff * -1;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}



