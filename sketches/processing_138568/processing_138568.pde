
//copyright Irene Joung 2014
//ICE#10

PImage pic;

void setup()
{
  size(600,600,P3D);
  pic=loadImage("flower.jpg");
  imageMode(CENTER);
  frameRate(10);
}

void draw()
{
  background(0);
  translate(width/2,height/2,-200);
  rotateX(frameCount);
  image(pic,0,0,400,200);
}


