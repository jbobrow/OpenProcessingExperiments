
void setup()
{
  size(10*52, 10*64);
  background(255);
  smooth();
  noLoop();
  print(distance(1, 2, 2, 5));
}

void draw()
{
  for (int i = 0; i < 10; i++)
  {
    for (int j = 0; j < 10; j++)
    {
      int r = round(random(150, 255));
      int g = round(random(100, 200));
      int b = round(random(50, 150));
      betterHouse(25+i*52, 2+j*64, r, g, b, r-40, g-40, b-20);
    }
  }
}

void betterHouse(int x, int y, int r, int g, int b, int roofR, int roofG, int roofB)
{
  fill(120, 70, 40);
  rect(x+10, y-2, 7, 30);
  fill(roofR, roofG, roofB);
  triangle(x, y, x-25, y+20, x+25, y+20);
  fill(r, g, b);
  rect(x-22, y+20, 44, 40);
  fill(120, 70, 40);
  rect(x-15, y+40, 10, 20);
  fill(255);
  rect(x+7, y+25, 10, 10);
  line(x+12, y+25, x+12, y+35);
  line(x+7, y+30, x+17, y+30);
  fill(0);
  ellipse(x-12, y+51, 2, 2);
}

float distance(int x1, int y1, int x2, int y2)
{
  return sqrt(sq(x2-x1)+sq(y2-y1));
}

/*
PImage img;

void setup()
{
  size(300, 300);
  img = loadImage("filename.png");
  noLoop();
}

void draw()
{
  image(img, 0, 0);
}
*/
