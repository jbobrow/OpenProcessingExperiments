

PImage img;

void setup() {
  img = loadImage("kirino.png");
  size(800,600);
}

void draw() {
  image(img, mouseX, mouseY,200,100);
}
