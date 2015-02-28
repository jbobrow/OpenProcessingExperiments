
int x = 0, speedX = 1;

void setup()
{
  size(200, 200);
}

void drawEllipse(int posY)
{
  ellipse (x, height/2 - 20, 10, 10);
  ellipse((width - x), height/2 + 20, 10, 10);
  x = x + speedX;
  if (x > width || x < 0)
    speedX = speedX * -1;
}

void fillshape()
{
  fill(0, 255, 255);
}

void draw()
{
  background(255); 
  
  // I could not remember how to call previously declared funtions.

  fill(0, 255, 255);
  ellipse (x, height/2 - 20, 10, 10);
  ellipse((width - x), height/2 + 20, 10, 10);
  x = x + speedX;
  if (x > width || x < 0)
    speedX = speedX * -1;
}
