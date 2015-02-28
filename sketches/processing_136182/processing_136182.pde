
//kevinkan ICE10
//copyright2014

PImage pic;

void setup()
{
  size(600,600,P3D);
  pic=loadImage ("1.jpg");
  imageMode(CENTER);
}

void draw()
{
  background(0,0,0);
  translate(width/2, height/2);
  rotateY(radians(frameCount));
  rotateZ(radians(frameCount));
  rotateX(radians(frameCount));
  image(pic, 0,0, 100, 150);
  
}


