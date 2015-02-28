
PImage img1;

void setup(){
  size(800,533);
  img1=loadImage("sink.jpg");
}

void draw(){
  background(255);
  image(img1, 0,0);
}

