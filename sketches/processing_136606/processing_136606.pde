
// Copyright Shannon Impellicceiri 2014
// Computer Arts with Processing T/H 11:30-1:30
// ICE #10
// 2/25/14

PImage pic;

void setup(){
  size(600,600,P3D);
  pic = loadImage("ShannonPhoto.jpg");
  imageMode(CENTER);
}

void draw(){
  background(0);
  translate(width/2,height/2,-200);
  rotateX(radians(frameCount));
  image(pic,0,0,200,200);
}


