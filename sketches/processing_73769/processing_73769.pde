
PShape stamp;
float h;
int xNum = 0;
int yNum = 0;

void setup()
{
  smooth();
  colorMode(HSB);
  size(720, 720);
  stamp = loadShape("stamp.svg");
  //noLoop();
  
  xNum = 30;
  yNum = 24;
}

void draw()
{
  //background(#6199c5);
  h = 130 + ((h + 1) % 10);
  fill(h, 255, 255, 10);
  noStroke();
  rect(0, 0, width, height);
  xNum = (xNum + 1) % 31;
  yNum = (yNum + 1) % 25;
  tiling(xNum, yNum);
}

void stamp(int x, int y)
{
  //int x = (int)random(0, 728);
  //int y = (int)random(0, 710);
  shape(stamp, x * 24, y * 30, 24, 30);
}

void tiling(int xCount, int yCount)
{
  for (int x = 0; x < xCount; x++)
  {
    for (int y = 0; y < yCount; y++)
    {
      stamp(x, y);
    }
  }
}


