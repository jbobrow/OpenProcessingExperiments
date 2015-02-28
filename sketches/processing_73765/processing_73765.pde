
PShape stamp;

void setup()
{
  smooth();
  size(800, 800);
  stamp = loadShape("stamp.svg");
  noLoop();
}

void draw()
{
  background(#6199c5);
  for (int i = 0; i < 3; i++)
  {
    int x = (int)random(0,728);
    int y = (int)random(0,710);
    shape(stamp, x, y, 72, 90);
  }
}

