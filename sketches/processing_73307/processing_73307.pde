
PImage car;
PImage bg;
int x;
int y;

void setup()
{
  size(540, 540);
  car = loadImage("car.png");
  bg = loadImage("background.png");
  x = -130;
  y = 100;
}

void draw()
{
  image(bg, 0, 0);
  if (x < width)
  {
    x = x + 2;
    y = y + 1;
  }
  else
  {
    x = -130;
    y = 100;
  }
  image(car, x, y);
}

