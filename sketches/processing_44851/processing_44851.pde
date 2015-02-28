
PImage img;

void setup(){
  size(800,533);
  img=loadImage("clothes.jpg");
}

void draw(){
  background(255);
  image(img, 0,0);
}

