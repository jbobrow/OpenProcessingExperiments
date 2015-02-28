

import processing.pdf.*;

float x, y;
float a,b;
float angle = 0; 
float r = 400;
float R = 100;

float diff = 1; 
float Diff = 2;

color col = color(210,87,0);
color col2 = color(0,87,0);

void setup() {
  size(600, 600);
  background(255);
  beginRecord(PDF, "every.pdf");
}

void draw() {

  fill(col); 
  
  
  x = r * cos(angle); 
  y = r * sin(angle);
 a = R * cos(angle/2); 
  b = R * sin(angle/2);

  strokeWeight(0.1); 
  stroke(0); 

  translate(width/2, height/2); 
  rotate(r); 
  rotate(-R); 

  ellipse(0, 0, x, y);

  //ellipse(x, 0, x, 50);
fill(col2);
ellipse( x, y, a, b); 

  angle = angle + 2;
  r = r - diff;
  R = R- 2*Diff;

  if ( r == 0 || r == 400) { 
    diff =  diff * -1;
  }
  if ( R == 0|| R == 100) { 
    Diff =  Diff * -1/2;
  }
}


void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}






