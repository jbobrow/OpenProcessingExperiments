
PImage img;

void setup() {
  size(500, 500);
  img = loadImage("selfie peeing.png");
}

void draw() {
  background(255, 0, 230);
  image(img, mouseX, mouseY, 288, 180);
}


