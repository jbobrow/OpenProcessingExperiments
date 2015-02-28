
PImage apple; // Declare object/variable
PImage worm;

void setup() {
  size(256,256);
  apple = loadImage("jonagoldapple.jpeg");
  worm = loadImage("worm.png");
}

void draw() {
  image(apple, 0, 0);
  image(worm, mouseX, mouseY);
}

