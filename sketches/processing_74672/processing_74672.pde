
//Justin L., OneHundredShapes, Mods 16/17 CP1

void setup()
{
  size(500, 500);
  frameRate(1);
}
void draw()
{
  background(0);
  fill(int(random(255)),int(random(255)),int(random(255)));
  int i = 1;
  while ( i < 100 )
  {
    ellipse(int(random(500)), int(random(500)), 20, 20);
    i++;
  }
}
