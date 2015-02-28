
int x = 100, speedX = 1;

void setup()
{
  size(200, 200);
}

void draw()
{
  background (255);
  block(30, 30);
}

void block(int posX, int posY)
{
  if (mouseX > 90 && mouseX < 110 && mouseY > 90 && mouseY < 110)
  {
  fill (255, 255, 0);
  ellipse(x+15, x + 25, 30, 30);
  ellipse(x, x, 30, 30);
  ellipse(x + posX, x, 30, 30);
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(x+15, x+11, 30, 30);
  fill(0, 0, 255);
  ellipse(x+15, x+11, 20, 20);
  fill(0, 255, 0);
  ellipse(x+15, x+11, 10, 10);
  fill (0);
  text ("Aint nobody got time for that!", 20, 20);
  }
  else
  {
  fill(0, 255, 255);
  fill (255, 255, 0);
  ellipse(x+15, x + 25, 30, 30);
  ellipse(x, x, 30, 30);
  ellipse(x + posY, x, 30, 30);
  fill(255, 0, 0);
  ellipseMode(CENTER);
  ellipse(x+15, x+11, 30, 30);
  fill(0, 0, 255);
  ellipse(x+15, x+11, 20, 20);
  fill(0, 255, 0);
  ellipse(x+15, x+11, 10, 10);
  x = x + speedX;
  if (x > 150 || x < 50)
  {
    speedX = speedX * -1;
  }
  }
}
