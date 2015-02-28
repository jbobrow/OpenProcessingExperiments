
int x,y;
int speedX, speedY;
int diam = 50;

void setup ()
{
  size (400,400);
  x = width/2;
  y = height/2;
}

void draw ()
{
  background (153,165,153);
  if (keyPressed)
  {
    if (key == 'u')
    {
      x =width/2;
      y = height;
      speedX = 0;
      speedY = -2;
    }
    else if (key == 'd')
    {
      x = width/2;
      y = 0;
      speedX=0;
      speedY = 2;
    }
    else if (key == 'l')
    {
      x = width/2;
      y = height/2;
      speedX=2;
      speedY=0;
    }
    else if (key == 'r')
    {
      x = width;
      y = height/2;
      speedX = -2;
      speedY = 0;
    }
  }
  if (y < 0)
  {
    speedY = speedY * -1;
  }
  else if (y > height)
  {
    speedY = speedY * -1;
  }
  if (x<0)
  {
    speedX=speedX * -1;
  }
  else if ( x> width)
  {
    speedX=speedX * -1;
  }
  fill (255,0,0);
  x = x + speedX;
  y = y + speedY;
  ellipse (x,y,diam,diam);
}
