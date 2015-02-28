
//Jonathan Huang, CP1, mods 16/17

int x = 1;
void setup()
{
  size(500, 500, P3D);
  stroke(x, x, x);
  frameRate(5);
}
void draw()
{
  background(0);
  pointLight(random(255), random(255), random(255), random(255), random(255), random(255) );
  while (x<=100)
  {
    int offsetX = int(random(0, 500));
    int offsetY = int(random(0, 500));
    translate(offsetX, offsetY, 0);
    box(20);
    translate(-offsetX, -offsetY, 0);
    x++;
  }
  if (x >= 100)
  {
    x=1;
  }
}
