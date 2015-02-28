
//lauren ruoff copyright 2014
//lruoff
//ICE 10

PImage pic;

void setup() {
  size(600, 600, P3D);
  background(0);
  imageMode(CENTER);
  
  pic = loadImage("piccc.jpg");
}

void draw() {
  prepareWindow();
  image(pic, 0, 0);
  
}

void prepareWindow() // moving the (0, 0) coordinate to the center
{
 background(0);
 translate(width/2, height/2, -200);
 rotateY(radians(frameCount));
}


