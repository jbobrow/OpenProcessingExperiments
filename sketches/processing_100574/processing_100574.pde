
int x;
int y;

color drawColor;

int windowWidth = 500;
int windowHeight = 500;

void setup()
{
  size (windowWidth, windowHeight);
  x = windowWidth / 2;
  y = windowHeight / 2;
  background(255);
  drawColor = color(random(256), random(256), random(256));
}

void draw()
{
  fill(drawColor);
  rect(x - 10, y - 10, 20, 20);
}

void keyPressed()
{
  if (key == ENTER)
  {
    background(random(256), random(256), random(256));
    drawColor = color(random(256), random(256), random(256));
  }
  else if (key == CODED)
  {
    if (keyCode == ENTER)
    {
      background(255);
    }
    else if (keyCode == UP)
    {
      y -= 5;
      if (y < 0)
      {
        y += windowHeight;
      }
    }
    else if (keyCode == DOWN)
    {
      y += 5;
      if (y > windowHeight)
      {
        y -= windowHeight;
      }
    }
    else if (keyCode == LEFT)
    {
      x -= 5;
      if (x < 0)
      {
        x += windowWidth;
      }
    }
    else if (keyCode == RIGHT)
    {
      x += 5;
      if (x > windowWidth)
      {
        x -= windowWidth;
      }
    }
  }
}
