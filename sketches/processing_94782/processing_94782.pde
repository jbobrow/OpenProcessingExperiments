
PImage qtb;                                //the pic
PImage agwl;                               //left angel wing
PImage agwr;                               //right angel wing
float rotx = PI/4;                         //variable
float roty = PI/4;                         //variable

void setup(){
  size(400,400, P3D);                      //window and 3D
  qtb= loadImage ("qtb.gif");              //image
  agwl= loadImage ("leftwingw.gif");       //left angel wing
  agwr= loadImage ("rightwingw.gif");      //right angel wing
  textureMode(NORMAL);                     //image appear
}

void draw(){
  background(255);                         //white
  translate(200, 200, 0);                  //stays in place
  rotateX(rotx);                           //rotate left right
  rotateY(roty);                           //rotate up down
  scale(80);                               //size of cube
  TexturedCube(qtb);                       //calling cube
  
  image(agwl,-1.9,-1.25,1,1);              //left angel wing
  image(agwr,.9,-1.25,1,1);                //right angel wing
  
  
}

void TexturedCube(PImage qtb){
  beginShape(QUADS);                        //the beginning
  texture(qtb);                             //texture is pic
  
  //font face
  vertex(-1, -1,  1, 0, 0);                 //left top
  vertex( 1, -1,  1, 1, 0);                 //right top
  vertex( 1,  1,  1, 1, 1);                 //right bottom
  vertex(-1,  1,  1, 0, 1);                 //left bottom

  //back face
  vertex( 1, -1, -1, 0, 0);                 //left top
  vertex(-1, -1, -1, 1, 0);                 //right top
  vertex(-1,  1, -1, 1, 1);                 //right bottom
  vertex( 1,  1, -1, 0, 1);                 //left bottom

  //bottom face
  vertex(-1,  1,  1, 0, 0);                 //left top
  vertex( 1,  1,  1, 1, 0);                 //right top
  vertex( 1,  1, -1, 1, 1);                 //right bottom
  vertex(-1,  1, -1, 0, 1);                 //left bottom

  //top face
  vertex(-1, -1, -1, 0, 0);                 //left top
  vertex( 1, -1, -1, 1, 0);                 //right top
  vertex( 1, -1,  1, 1, 1);                 //right bottom
  vertex(-1, -1,  1, 0, 1);                 //left bottom

  //right face
  vertex( 1, -1,  1, 0, 0);                 //left top
  vertex( 1, -1, -1, 1, 0);                 //right top
  vertex( 1,  1, -1, 1, 1);                 //right bottom
  vertex( 1,  1,  1, 0, 1);                 //left bottom

  //left face
  vertex(-1, -1, -1, 0, 0);                 //left top
  vertex(-1, -1,  1, 1, 0);                 //right top
  vertex(-1,  1,  1, 1, 1);                 //right bottom
  vertex(-1,  1, -1, 0, 1);                 //left bottom

  endShape();                               //to end it
}

void mouseDragged() {
  float rate = 0.01;                        //rotating it smoothly
  rotx += (pmouseY-mouseY) * rate;          //drag up down
  roty += (mouseX-pmouseX) * rate;          //drag left right
}

