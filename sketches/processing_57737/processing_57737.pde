
//Problem Set 3
//Question 3 Remix
//Karen Wan
//instead of having 1 image on the sides i had placed 6 different images on each side. i also added a background

PImage a1;
PImage a2;
PImage a3;
PImage a4;
PImage a5;
PImage a6;
PImage b2;
float rotx = PI/4;
float roty = PI/4;

void setup() 
{
  size(640, 380, P3D);
  a1 = loadImage("1.JPG");
  a2 = loadImage("2.JPG");
  a3 = loadImage("3.JPG");
  a4 = loadImage("4.JPG");
  a5 = loadImage("5.JPG");
  a6 = loadImage("6.JPG");
  b2 = loadImage("b1.jpg");
  textureMode(NORMALIZED);
}

void draw() 
{
  background(b2);
  noStroke();
  translate(width/2.0, height/2.0, -100);
  rotateX(rotx);
  rotateY(roty);
  scale(100);
  TexturedCube(a1,a2,a3,a4,a5,a6);
}

void TexturedCube(PImage a1,PImage a2,PImage a3,PImage a4,PImage a5,PImage a6) {
  beginShape(QUADS);
  texture(a1);

  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);
endShape();
 beginShape(QUADS);
  texture(a2);
  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);
endShape();
  beginShape(QUADS);
  texture(a3);
  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);
endShape();
 beginShape(QUADS);
  texture(a4);
  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);
endShape();
  beginShape(QUADS);
  texture(a5);
  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);
endShape();
 beginShape(QUADS);
  texture(a6);
  // -X "left" face
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

