

 
//int y;

import processing.opengl.*;

PImage logo;
PImage bg;
float rotation = 1.0;

public void setup() {
  size(570, 850, OPENGL);
  frameRate(12);
  bg = loadImage("patroon.jpg");
  logo = loadImage("test beeld voor draaien.png");
}

void draw() {
  background(255);
  image(bg,6,26);
  translate(width/2, height/4, 150);
  rotation+=.1;
  rotateY(rotation);
  image(logo, -logo.width/2,-logo.height/10);
}




