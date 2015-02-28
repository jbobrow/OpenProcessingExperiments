
int x;
void setup()
{
  size(400,400,P3D);
  background(255);
  smooth();
  int x = 0;
}

void draw()
{
  while(x < width-(width/3))
  {
  stroke(2);
  fill(255,55,25);
  translate(width/4+x, width/4+x, 0);
  box(width/20);
  x += 1;
  }
  noStroke();
  fill(55,255,25);
  translate(width/2, width/2, 0);
  lights();
  sphere(width/8);
}
