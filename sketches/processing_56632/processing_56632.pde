
int rectangleSize;
int x;
int y;

void setup()
{
  size(500, 500);
  background(255);
  fill(0);
  noStroke();
  rectMode(CENTER);
  rectangleSize = 20;
  x = 40;
  y = 40;
}

void draw()
{

  RedRectangles();
  BlackRectangles();
}

void BlackRectangles()
{
  fill(0);
  int i = 0;
  while(i < 10)
  {
    rect(x+i*(rectangleSize+5), y, rectangleSize, rectangleSize); 
    i++;
  }
}

void RedRectangles()
{
  fill(255, 0,0);
  for(int j = 0; j<10; j++)
  {
    rect(x+j*(rectangleSize+5), y+40, rectangleSize, rectangleSize); 
  }
}



