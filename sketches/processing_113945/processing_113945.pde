
void setup()
{
  size(600, 600);
  background(255, 255);
  rectMode(CORNER);
}

void draw()
{
  noStroke();
  float w=width;
  float h=height;

  for (int x=0; x<=width; x=x+40)
  {
    for (int y=0; y<=height; y=y+40)
    {
      fill(random(255));
      rect(mouseX, y-40, random(mouseX), y);
    }
  }
}
