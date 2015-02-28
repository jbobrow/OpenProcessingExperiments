
// HW 12 - Computing for the Arts with Processing
// © Asa Foster 2011

import processing.opengl.*;

PImage armSide1, armSide2, armBottom, armTop, face, head,
       legBottom, legFront, legSide, legTop,
       torsoBack, torsoBottom, torsoFront, torsoSide, torsoTop, bg;

// movement variables
float rotX = 0;
float rotY = PI/4;
float rotZ = 0;
float zoom = -300;
float zoomRate = 0;
float xValue = 140;
float yValue = 0;
float xPercent = 0;
float yPercent = 0;
float xLoc = -800;
float yLoc = 600;
float walkRotator = 0;
float time = 0;


//=======================================================================================================

void setup() {
  size(1000, 600, OPENGL);
  textureMode(NORMALIZED);
  rectMode(CENTER);
  noStroke();
  smooth();
  
  armSide1 = loadImage("armSide1.png");
  armSide2 = loadImage("armSide2.png");
  armBottom = loadImage("armBottom.png");
  armTop = loadImage("armTop.png");
  face = loadImage("face.png");
  head = loadImage("head.png");
  legBottom = loadImage("legBottom.png");
  legFront = loadImage("legFront.png");
  legSide = loadImage("legSide.png");
  legTop = loadImage("legTop.png");
  torsoBack = loadImage("torsoBack.png");
  torsoBottom = loadImage("torsoBottom.png");
  torsoFront = loadImage("torsoFront.png");
  torsoSide = loadImage("torsoSide.png");
  torsoTop = loadImage("torsoTop.png");
  bg = loadImage("bg.png");
}

//=======================================================================================================

void draw() {
  background(bg);
  moveCreeper();
  drawCreeper(); 
}

//=======================================================================================================

void moveCreeper() {
  xPercent = (xValue / 400) * 100;
  xLoc = xLoc + (xPercent / 5);
  if(xLoc > width + 800) {
    xLoc = -800;
  }
  yLoc = 300 + (10 * sin((time*2 + .02) * PI));
  translate(xLoc, yLoc, zoom);
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  scale(30);
}

//=======================================================================================================



