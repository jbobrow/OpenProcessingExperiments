

import peasy.*;

PeasyCam cam;

void setup() {
  size(800,800,P3D);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(150);
  cam.setMaximumDistance(150);
}
void draw() {
  rotateX(-5);
  rotateY(-4);
  background(0);
  fill(150);
  stroke(175);
  sphere(210);
   ambientLight(250, 0, 0, 200, 100,100);
   
  pushMatrix();
  translate(0,0,30);
  fill(0,100,102);
   stroke(0,100,102);
  box(22);
translate(0,0,30);
  fill(0,200,120);
   stroke(0,200,120);
  box(15);
  
  translate(0,0,-60);
  fill(0,200,120);
   stroke(0,200,120);
  box(15);
  ambientLight(255, 255, 255, 0, 200,0);
    directionalLight(150, 100, 200, 100, 550, 500);
  popMatrix();
  


  
    
}
