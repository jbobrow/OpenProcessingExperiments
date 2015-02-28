
//Using Follow


/* @pjs preload="bathtub.jpg"; */


PShape gir02; 
PShape soap1;
PImage back;
float x = 100;
float y = 100;
float angle1 = 0.0;
float segLength = 30;

void setup() {
  size(640, 470);
  strokeWeight(20.0);
gir02 = loadShape("gir02-01.svg");
smooth();
soap1 = loadShape("soap.svg");
 smooth();
 back = loadImage("bathtub.jpg");
 
  //stroke(255, 100);
}

void draw() {
  background(back);
  
  float dx = mouseX - x;
  float dy = mouseY - y;
  angle1 = atan2(dy, dx);  
  x = mouseX - (cos(angle1) * segLength);
  y = mouseY - (sin(angle1) * segLength);
 
  segment(x, y, angle1); 
  shape(soap1, x, y, 50, 50);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  shape(gir02, segLength, segLength, 305 * 0.5, 446 * 0.5);
  popMatrix();
}


