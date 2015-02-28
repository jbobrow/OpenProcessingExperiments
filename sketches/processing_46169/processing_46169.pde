
PImage ariplane;

void setup(){
  size(1000, 1000);
  ariplane = loadImage("ariplane.jpg");  
}

void draw(){
  tint(255,255,255,150);
  image(ariplane, mouseX,mouseY,400,400);
  image(ariplane, 10, 10);
  delay (200);
  
}

