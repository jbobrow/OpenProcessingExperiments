
//import processing.opengl2.*;

import processing.opengl.*;

float a; 
		
void setup() {
  //size(800, 600, P3D);
  size(1600, 900, OPENGL);
  //size(1600, 900, OPENGL2);
  fill(0, 127);
  noStroke();
  smooth();
}
		
void draw() {
  background(255);
  
  pushMatrix();
  translate(width/2, height/2);
  for(int i=0;i<255;i++) {
    rotateX(a+i);
    rotateY(a*2+i);
    rect(-200, -200, 400, 400);
  }
  for(int i = 0 ; i < 255 ; i++) {
    rotateX(PI/2+i);
    rect(-200, -200, 400, 400); 
  }
  a += 0.01;
  popMatrix();
  
  pushStyle();
  fill(255,0,0);
  text((int)frameRate + " fps", 15,15);
  popStyle();
}

