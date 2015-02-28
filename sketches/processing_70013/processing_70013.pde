
int cX = 70;
int cY = 10;

int speedX = 15;
int speedY = -15;
void setup()

{
  size(400, 400);
  smooth();
}

void draw()
{
  fill(255, 0.3);
  rect(0, 0, width, height);

  fill( random(0, 255), random(0, 255), random(0, 255), 100);
  ellipse(cX, cY, 30, 30);
  cX = cX + speedX;
  cY = cY + speedY;

  if (cX > width -15) {
    speedX = speedX  * -1;
  }

  if (cX < 15) {
    speedX = speedX * -1;
  }

  if (cY > 390) {
    speedY = speedY * -1;
  }

  if (cY < 10) {
    speedY = speedY * -1;
  }
}


