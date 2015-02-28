
//Copyright Christopher Henley 2014

PImage pic;

void setup(){
  size(600,600,P3D);
  pic=loadImage("imgA.JPG");
  imageMode(CENTER);
}

void draw(){
  background(0);
  translate(width/2,height/2,-200);
  rotateX(radians(frameCount));
  rotateY(radians(frameCount));
  rotateZ(radians(frameCount));
  image(pic,0,0,400,400);
}


