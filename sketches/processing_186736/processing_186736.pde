
float spin = 8;

void setup() {
  size(600, 600, P3D);
  noStroke();
}

void draw() {
  background(51);
 
  if (!mousePressed) {
    lights();
  }
 
  noFill();
stroke(204,102,0);
pushMatrix();
translate(500, height*0.35, -200);
 rotateX(PI/8);
 rotateY(PI/5 - spin*1.5);
sphere(280);
popMatrix();

{
  translate(5, 8);
 lightSpecular(0, 2, 5);
  directionalLight(50, 200, 400, 10, 0, 250);
  float s = mouseX / float(width);
  specular(85, 89, 122);
  sphere(45);
  
  
  }
  
  spin += 0.01;
 stroke(255)
  pushMatrix();
  translate(width/5, height/3, 0);
  rotateX(PI/9);
  rotateY(PI/5 + spin);
  box(150);
  popMatrix();
 
 stroke(11,239,244);
  pushMatrix();
  translate(width/4, height/2, 0);
  rotateX(PI/9);
  rotateY(PI/5 + spin);
  box(150);
  popMatrix();



}﻿
