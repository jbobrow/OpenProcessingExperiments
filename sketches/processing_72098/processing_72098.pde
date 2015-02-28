
//Michelle Z, CP1 4-5, Ticklish Penguin

int x = 200;
int y = 200;
int secondX = 200;
int secondY = 200;

void setup()
{
  size(400, 400);
  background(0);
  noStroke();
  smooth();
  frameRate(10);
}

void draw()
{
  fill(0, 0, 0, 50);
  rect(0, 0, 400, 400);
  fill(0, 244, 255);
  ellipse(x, y, 20, 20);
  ellipse(y, x ,20,20);
  
  fill(211,79,229);
  ellipse(secondX,secondY,20,20);
  ellipse(secondY,secondX,20,20);

  int direction = int (random(0, 4));
  if (direction == 0)
  {
    x = x + 20;
    secondX = secondX - 20;
    if (x > 400)
    {
      x = x - 20;
      secondX = secondX + 20;
    }
  }
  else if (direction == 1)
  {
    x = x - 20;
    secondX = secondX + 20;
    if (x < 0)
    {
      x = x + 20;
      secondX = secondX - 20;
    }
  }
  else if (direction == 2)
  {
    y = y + 20;
    secondY = secondY - 20;
    if (y > 400)
    {
      y = y - 20;
      secondY = secondY + 20;
    }
  }
  else if (direction == 3)
  {
    y = y - 20;
    secondY = secondY + 20;
    if (y < 0)
    {
      y = y + 20;
      secondY = secondY - 20;
    }
  }
}

