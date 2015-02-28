
float posX;
float posY;
int ballColor;
float speedX;

void setup() {
  size(300, 140);
  posX = 150;
  posY = 70;
  speedX = 3;
  ballColor = color(0, 200, 0);
}

void draw() {
  background(0);
  if (posX > width) {
    speedX = speedX * -0.99;
  }
  fill(ballColor);
  ellipse(posX, posY, 20, 20);
  posX = posX + speedX;
}


