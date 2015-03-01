
PImage img;

void setup() {
  size(960,639);
  img = loadImage("Light.jpg");
}

void draw() {
  if (mousePressed==true){
  image(img, 0, 0);
  }
  else
{
  background(0);
  }
 }


