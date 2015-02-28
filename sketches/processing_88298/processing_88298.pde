
int r, g, b;

void setup()
{
  size(200, 200);
  r = g = b = 255;
  background(255);
}

void draw()
{
  if (frameCount % 340 == 0)
    background(255);
  if (frameCount % 60 == 0)
  {
    r = (int) random(255);
    g = (int) random(255);
    b = (int) random(255);
  }
  fill(r, g, b);
  rect(random(width - 10), random(height-10), 10, 10);
}
