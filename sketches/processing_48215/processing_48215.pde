
PImage s;
void setup()
{
  size(600, 600);
  smooth();
  s = loadImage("logo.png");
  noLoop();
}
void draw()
{
  background(255);
  for (int x=0; x< width; x= x+50)
  {
    for (int y=0; y<height; y=y+50)
    {
      float t = map(x+y, 0, height, width, random(20));
      float siz = map(x+y, 0, 900, 1, 3);
      float r = map(x+y, 0, 1.0, 0.1, 0);
      drawLogo(x, y, t, siz, r);
    }
  }
}
void drawLogo (int x, int y, float t, float siz, float r)
{
  pushMatrix();
  scale(random(1.1, 3));
  rotate(PI/r);
  image(s, x, y, 60, 60);
  popMatrix();
}


