
PImage img;
void setup() {
size(2500, 1500);
img = loadImage("car33.png");
}

void draw() {
  background(0);
  image(img, mouseX , mouseY);
}
