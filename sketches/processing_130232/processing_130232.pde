
int dim;
float timer = 0.0;

void setup()
{
  size(640,360);
  dim = width/2;
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(30);
}
void draw()
{
  background(0);
  timer = timer + (1.0/30.0);
    for (int x = 0; x <= width; x+=dim)
    {
      drawGradient(x, height/2);
    }
    if (timer >= 2.0)
    {
      filter(INVERT);
    }

}
void drawGradient (float x, float y)
{
  int radius = dim/2;
  float h = random(0, 360);
  for (int r = radius; r > 0; --r)
  {
    fill(h, 90, 90);
    ellipse(x,y,r,r);
    h = (h+1) % 360;
  }
}


