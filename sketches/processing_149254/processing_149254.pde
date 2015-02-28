
PImage img;
float offset = 0;
float easing = 0.05;

void setup() {
  size(640, 360);
  img = loadImage("Grievous.jpg");
}

void draw() {
  background(200);
  image(img, 0, 0);
  float dx = (mouseX-img.width/2) - offset;
  offset += dx * easing;
  tint(225, 126); 
  image(img, offset, 0);
}


