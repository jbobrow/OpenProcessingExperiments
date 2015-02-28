
PImage car, backPNG;
float posX, posY;
void setup() {
  size(548, 548);
  posX = -130;
  posY = 100;
  car = loadImage("car.png");
  backPNG = loadImage("background.png");
}

void draw() {
  image(backPNG, 0, 0);
  posX += 2;
  posY += 1;
  image(car, posX, posY);
  if (posX > width) {
    posX = -130;
    posY = 100;
  }
}
