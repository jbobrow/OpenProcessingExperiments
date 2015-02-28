
import processing.opengl.*;
import fullscreen.*; 

FullScreen fs;

float inc = 0;

PImage img;
PImage img2;

void setup () {
   size (2550, 1440, OPENGL);
   frameRate(25);
   fs = new FullScreen  (this);
   fs.enter();
   background (53,78,201);
   smooth();
   ellipseMode(CENTER);
   img = loadImage("cat.png");
   img2 = loadImage("brust.png");
  
}

void draw () {
  if (mousePressed) {
    fill(255);
    lights();
    inc+=0.1;
    pushMatrix();
    translate(mouseX, mouseY);
    rotateX(mouseX*0.02);
    rotateY(mouseY*0.02);
    stroke(0);
    strokeWeight(1);
    image(img,mouseX,mouseY);
    popMatrix();
    

} else {

  stroke (237,17,57);
  strokeWeight(10);
  image(img2,mouseX,mouseY);
}
}
