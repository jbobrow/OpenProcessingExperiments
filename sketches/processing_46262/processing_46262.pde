

import processing.opengl.*;
float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3.3;
int rectWidth = 10  ;
int value=10;
int bSize = 100;
int sSize = 200;
int num = 60;
float mx[] = new float[num];
float my[] = new float[num];




void setup() {
  smooth();
  size(600, 600, P3D);
}


void draw() {
  PImage b;
b = loadImage("IMG_0395.jpg");
b.resize(600, 600);
background(b);
  lights();
  noStroke();
  pushMatrix();
  translate(300, 300, 0);
  rotateY(1.25);
  rotateX(-0.4);

  box(bSize);
  popMatrix();

  if (keyPressed)
    bSize=mouseX;




  noFill();
  stroke(255);
  //noStroke();
  pushMatrix();
  translate(300, 300, 0);
  sphere(sSize);
  popMatrix();
  if (keyPressed)
    sSize=mouseY;


  noStroke();
  fill(int(random(300)),int(random(300)),int(random(300)));


  if (mousePressed) {

 
    camera(mouseX, mouseY, 600.0, // eyeX, eyeY, eyeZ
    300.0, 300.0, 00.0, // centerX, centerY, centerZ
    0.0, -1.0, 0.0);
   
  }
}


