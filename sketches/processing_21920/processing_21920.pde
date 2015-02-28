
PImage img1, img2;

void setup() {
  size(800, 531);
  img1 = loadImage("byetwo.png");
  img2 = loadImage("byethree.png");
}

void draw(){
  background(0);
  image(img1, 0, 0);
  int my = constrain(mouseY, 0, 483);
  copy(img2, 1, my, 900, 33, 0, my, 800, 50);
}

