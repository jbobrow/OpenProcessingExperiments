
import processing.pdf.*;
 
 
 
float x, y;
float angle = 20;
float r = 100;
float diff = 4;
 
 
void setup() {
  size(600, 600);
  background(100);
 
}
 
void draw() {
 
  noFill();
 
 
  x = r * cos(30*100);
  y = r * sin(angle);
 
  strokeWeight(0.12);
  stroke(20);
 
  translate(width/2, height/2);
  rotate(r);
 
  ellipse(0, 0, x, y);
 
  
 
  angle = angle +0.5;
  r = r - diff;
 
  if ( r == 0 || r == 600) {
    diff =  diff * -1;
  }
}

