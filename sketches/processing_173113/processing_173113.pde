
float n;
int sz;

void setup()
{
  sz = 250;
  size(sz*2, sz*2);
  colorMode(HSB);
  n = 0;
}

void draw()
{
background(255);
  n += 0.01;
  for (float ang = 0; ang < 6.28; ang+=0.1)
    line(sz+sz*cos(ang),sz+sz*sin(ang),sz+sz*cos(n*(ang + 0.01)),sz+sz*sin(n*(ang + 0.01)));
}
