
// Loads a PNG image with 8-bit transparency
PImage img;

void setup() {
  size(600, 600);
  smooth();
  img = loadImage("arch.png");
  background(255, 0, 0);
  image(img, 0, 0);
  image(img, -20, 0);
}

void draw(){
  tint(255, 25);
  image(img, mouseX, mouseY);
}

