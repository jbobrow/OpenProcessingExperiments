
//Aaron L., CP1, Mods 4-5,
int z = 1;
void setup()
{
  size(500, 500);
    background(0);
  frameRate(1);
}
void draw()
{
  while (z<=100)
  {
    fill(random(255), random(255), random(255));
    ellipse(random(501),random(501), random(100), random(100));
    z++;
  }
}
void mousePressed()
{
  z=1;
  ellipse(random(255),random(255),random(255),random(255));
}
