
PImage img;

void setup() {
  size(200, 300);
  img = loadImage("dancing.jpg");
}

void draw() {
  background(255);
  image(img, 0, 0);
  image(img, 0, mouseY * -1);
  
}



