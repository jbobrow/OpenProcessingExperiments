
int posX = 0;
int posY = 0;
int velX = 13;
int velY = 19;

void setup() {
  size(400, 400);
  frameRate(30);
}

void draw() {
  background(100);
  ellipse(posX, posY, 20, 20);
  posX = posX + velX;
  posY = posY + velY;
  if (posX < 10||posX > width - 10)velX = -1 * velX;
  if (posY < 10||posY > height - 10)velY = -1 * velY;
}



