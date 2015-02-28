
//Lawrence Jiang, Ticklish Penguin, Block 6
//press space to reset

int x = 400;
int y = 300;
int r = 122;
int g = 123;
int b = 122;
void setup()
{
  size(800, 600);
}

void draw()
{
 circle();
}

void circle()
{
  //background(0);
  ellipse(x, y, 25, 25);
  ellipse(x, 600-y, 25, 25);
  ellipse(800-x, y, 25, 25);
  ellipse(800-x, 600-y, 25, 25);
  x = x + int (random(-5, 5));
  y= y + int (random(-5, 5));
  fill(r, g, b);
  r = r + int (random(-10,10));
  g = g + int (random(-10,10));
  b = b + int (random(-10,10));
}

void keyPressed()
{
  if (key==' ')
  {
    x = 400;
    y = 300;
    background(255-r,255-g,255-b);
  }
}
