
//3D experimentation

import processing.opengl.*;

float x=0;
float angle = 0;
float mx,my,mz;
float directionx,directiony,directionz;

void setup(){
  size(600,600,OPENGL);
  smooth();

}

void draw(){
  background(0);
  stroke(100);
  x+=0.005;
  pushMatrix();
  translate(300,300);
  //rotateY(map(mouseX,0,width,0,PI));
  //rotateX(map(mouseY,0,height,0,PI));
  //pushMatrix();
  rotateY(x);
  sphere(100);
  popMatrix();
  
  pushMatrix();
  rotateY(x);
  mx = cos(radians(angle*.01)) * 200 + 300;
  my = sin(radians(angle*.01)) * 200 + 300;
  //mz = tan(radians(angle*.01)) * 50 + 200;
  translate(mx,my);
  sphere(50);
  popMatrix();
  
}

