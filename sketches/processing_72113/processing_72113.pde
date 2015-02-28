
int r = 54;
int g = 245;
int b = 183;
int changeColor = 5;
int x = 250;
int y = 250;
void setup ()
{
  size (500, 500);
  frameRate (10);
  background (255, 255, 255);
}
void draw ()
{
  noStroke();
  fill(255,255,255,10);
  rect(0,0,500,500);
  stroke(0);
  fill (r, g, b);
  r = r + changeColor;
  g = g - changeColor;
  b = b + changeColor;
  if (r > 195)
  {
    changeColor = -changeColor;
  }
  if (r < 73)
  {
    changeColor = 20;
  }
  ellipse (x, y, 50, 50);
  fill (b, g, r);
  ellipse (y, x, 50, 50);
  int direction = int (random(0, 4));
  if (direction == 0)
  {
    x = x + 15;
  }
  else if (direction == 1)
  {
    x = x - 15;
  }
  else if (direction == 2)
  {
    y = y + 15;
  }
  else 
  {
    y = y - 15;
  }
}
