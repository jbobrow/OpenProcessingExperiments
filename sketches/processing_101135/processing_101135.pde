
/* @pjs preload="elesmall.jpg" */

float a;


void setup() {
  size(640, 360);
  stroke(255);
  a = height/2;
}

void draw() {
  PImage ele = loadImage("elesmall.jpg");
  background(51);
  image(ele,a,150);
  
  a = a + 0.5;
  if (a < 0) { 
    a = width; 
  }
}


