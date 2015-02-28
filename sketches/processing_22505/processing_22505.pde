
PImage img1, img2;

void setup() {
  size(600, 600);
  img1 = loadImage("IMG_0342.jpg");
  img2 = loadImage("IMG_0367.jpg");
}

void draw() {
  background(255);
  image(img1, 0, 0);
  int my = constrain(mouseY, 0, 500);
  copy(img2, 0, my, 800, 100, 0, my, 800, 100);
}

