
//This sketch was made by referencing the "Texture Cube" example 
//by Dave Bollinger in Processing.
//
//-Lisa Looye
// 
//  
//  Click and Drag mouse to rotate shape. 



  /*@pjs preload="tilda-swinton.jpg"; */

PImage img;
float rotx = PI/4;
float roty = PI/4;
float angle = 0.0;

void setup() {
  size(936,1180, P3D);
  img = loadImage("tilda-swinton.jpg");
  textureMode(NORMAL);
  fill(255);
  stroke(color(44,48,32));
  noCursor();
}

void draw() {
  image(img,0,0);
  noStroke();
 
  PImage magnifier = img.get(mouseX, mouseY,50,50);
  translate(mouseX+50, mouseY-50);
  magnifier.resize(100,0);
  magnifier.filter(BLUR,4);
  
  rotateX(rotx);
  rotateY(roty);
  scale(100);
  TexturedCube(magnifier);
   if (keyPressed == true) {
    saveFrame();
  }
}

void TexturedCube(PImage img) {
 
  beginShape(QUADS);
  
  texture(img);

 
  // +Z "front" face
  vertex(0, -1,  1, 0, 0);
  vertex( 0, -1,  1, -1, 0);
  vertex( 1,  1,  1, -1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 0, -1, -1, 0, 0);
  vertex(0, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // +X "right" face
  vertex( 0, -1,  1, 0, 0);
  vertex( 0, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(0, -1, -1, 0, 0);
  vertex(0, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
}

void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}



