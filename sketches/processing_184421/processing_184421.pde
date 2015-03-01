
int r1 = 180;
int g1 = 180;
int b1 = 180;
int r2 = 180;
int g2 = 180;
int b2 = 180;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  strokeWeight(5);
  stroke(r1, g1, b1, 150);
  for (int i = 55; i < 450; i = i + 20)
  {
    line(40, i, 450, i);
  }
  stroke(r2, g2, b2, 150);
  for (int j = 55; j < 450; j = j + 20)
  {
    line(j, 40, j, 450);
  }
  if (mousePressed && mouseButton == LEFT)
  {
    r1 = 35;
    g1 = 118;
    b1 = 216;
    r2 = 242;
    g2 = 245;
    b2 = 87;
  }
  if (mousePressed && mouseButton == RIGHT)
  {
    r1 = 216;
    g1 = 35;
    b1 = 38;
    r2 = 37;
    g2 = 214;
    b2 = 38;
  }
  if (!mousePressed)
  {
    r1 = 180;
    g1 = 180;
    b1 = 180;
    r2 = 180;
    g2 = 180;
    b2 = 180;
  }
}



