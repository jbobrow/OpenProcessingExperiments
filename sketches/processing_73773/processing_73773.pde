
PShape stamp;
float h;
int xNum = 0;
int yNum = 0;

int arraySize = 720;
int[] xPoints = new int[arraySize];
int[] yPoints = new int[arraySize];
int index = 0;

void setup()
{
  smooth();
  colorMode(HSB);
  size(720, 720);
  stamp = loadShape("stamp.svg");
  //noLoop();
  
  xNum = 30;
  yNum = 24;
  
  for (int i = 0; i < arraySize; i++)
  {
      xPoints[i] = -100;
      yPoints[i] = -100;
  }
}

void draw()
{
  //background(#6199c5);
  h = (h + 1) % 255;
  fill(h, 255, 255, 10);
  noStroke();
  rect(0, 0, width, height);
  
  drawStamps();
  
  /*-----Tiling Code-----
  xNum = (xNum + 1) % 31;
  yNum = (yNum + 1) % 25;
  tiling(xNum, yNum);
  ---------------------*/
}

void mousePressed()
{
  xPoints[index] = mouseX;
  yPoints[index] = mouseY;
  index = index + 1 % arraySize;
}

void drawStamps()
{
  for (int i = 0; i < arraySize; i++)
    {
      stamp(xPoints[i], yPoints[i]);
    }
}
void stamp(int x, int y)
{
  shape(stamp, x, y, 24, 30);
}

void tiling(int xCount, int yCount)
{
  for (int x = 0; x < xCount; x++)
  {
    for (int y = 0; y < yCount; y++)
    {
      stamp(x * 24, y * 30);
    }
  }
}




