
//Kelly Fadem Midterm
//Connect 3 Points in Space

import processing.opengl.*;
float x,y,z,angle;
void setup(){
  size(800,800,OPENGL);
  x=0;
  y=0;
  angle=0;
  smooth();
}

void draw(){
  background(255);
  drawPoint1();
  drawPoint2();
  drawPoint3();
}

void drawPoint1(){
  stroke(random(255), random(255),random(255),50); 
  fill(random(220,256),random(30,256),random(30,256),70); 
  x = tan(sin(radians(angle))) + 100 + height/2;
  y = tan(cos(radians(angle))) * 100 + width/2;
  z = tan(cos(radians(angle))) * 100 + width/2;
  pushMatrix();
  translate(x,y,z);
  rotateY(z);
  rotate(z);
  sphere(50);
  popMatrix();
  angle+=.1;
  }

void drawPoint2(){
  stroke(random(255), random(255),random(255),50); 
  fill(random(30,256),random(30,256),random(30,256),70);
  x = tan(cos(radians(angle))) * 100 + height/2;
  y = tan(cos(radians(angle))) + 100 + width/2;
  z = tan(sin(radians(angle))) * 100 + width/2;
  pushMatrix();
  translate(x, y, z);
  rotateY(z);
  rotate(z);
  sphere(50);
  popMatrix();
  angle+=.2;
  }

void drawPoint3(){
  stroke(random(255), random(255),random(255),50); 
  fill(random(30,256),random(30,256),random(30,256),70);
  x = tan(cos(radians(angle))) * 100 + height/2;
  y = tan(sin(radians(angle))) * 100 + width/2;
  z = tan(cos(radians(angle))) + 100 + width/2;
  pushMatrix();
  translate(x,y,z);
  rotateY(z);
  rotate(z);
  sphere(50);
  popMatrix();
  angle+=.3;
  }

