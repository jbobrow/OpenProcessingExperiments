
int posX = 0;
int posY = 0;
int speedY= 5;
int speedX = 2;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  posX = posX + speedX;
  posY = posY + speedY;

  if (posX > width) {
    speedX = speedX* -1;
  }

  if (posX < 0) {
    speedX = speedX* -1;
  }

  if (posY > height) {
    speedY= speedY* -1;
  }
  
  if (posY < 0) {
    speedY= speedY*-1;
  }
  ellipse(posX, posY, 50, 50);
}
