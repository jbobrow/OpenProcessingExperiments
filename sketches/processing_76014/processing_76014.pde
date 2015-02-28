
//Aaron L. , CP1, Mods 4-5, Doubling Shapes
int z = 1;
int count=1;
void setup()
{
  size(500, 500);
  frameRate(1);
  textSize(100);
}
void draw()
{
  background(0);
  while (count <= z)
  {
    fill(random(255), random(255), random(255));
    ellipse(random(501), random(501), random(100), random(100));
    text(z, 0, 500);
    count++;
  }
  z = z * 2;
  while (z==4096)
  {
    fill(0);
    z=1;
  }
}
