
import processing.opengl.*;

PImage p1;
PImage p2;
PImage p3;
PImage p4;
PImage p5;
PImage p6;
float rotx = PI/4;
float roty = PI/4;

void setup(){
  size( 300, 300, OPENGL);
  p1 = loadImage( "1.PNG" );
  p2 = loadImage( "2.PNG" );
  p3 = loadImage( "3.PNG" );
  p4 = loadImage( "4.PNG" );
  p5 = loadImage( "5.PNG" );
  p6 = loadImage( "6.PNG" );
  textureMode(NORMALIZED);
}

void draw(){
  background(128);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(90);
  // Front
  beginShape(QUADS);
  texture(p1);
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
  endShape();
  // Back
  beginShape(QUADS);
  texture(p6);
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);
  endShape();
  // Bottom
  beginShape(QUADS);
  texture(p5);
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
  // Top
  beginShape(QUADS);
  texture(p2);
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
  endShape();
  // Right
  beginShape(QUADS);
  texture(p3);
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
  endShape();
  // Left
  beginShape(QUADS);
  texture(p4);
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}


