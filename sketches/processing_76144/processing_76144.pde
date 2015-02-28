
//kevin hyun khyun
//copyright 2012


void setup()
{
  size(400, 400);
  smooth();
}

void draw()
{
  drawBackground();
  fillColor();
  drawCircle();
}

void drawBackground()
{

  if (keyPressed)
  {
    if (key =='b')
    {
      background(0, 0, 0);
    }
    if (key =='c')
    {
      background(130, 130, 130);
    }
  }
}

void drawCircle()
{
  noStroke();
  int x = 0;
  while (x < mouseX )
  {
    ellipse(width/2, height/2, x, x);
    x++;
  }
}

void fillColor()
{
  float r = map(mouseX, 0, width, 0, 255);
  float g = map(mouseX, 0, width, 0, 255);
  float b = map(mouseX, 0, width, 0, 255);
  fill(r, g, b);
}


