

import processing.pdf.*;

float x, y;
float angle = 0; 
float r = 10;
float diff = 1; 
float c1 = 0;
float a = 0;
float b = 10;
void setup() {
  size(600, 600);
  background(0);
  beginRecord(PDF, "pattern.pdf");
  colorMode(HSB, 100);
}

void draw() {

  noFill(); 


  x = r * cos(angle); 
  y = r * sin(angle) ;


  c1 = c1+1;
  if(c1 > 100){
    c1 = 0;
  }
    stroke(c1, 100, 100, 100 ); 
  translate(width/2, height/2); 
  


  rect( a, b, x, y );

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

