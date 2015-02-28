
//Jonathan Huang, CP1, mods 16/17

int x = 1;
int y = 1;
void setup()
{
  size(500, 500, P3D);
  stroke(x,x,x);
  fill(random(255), random(255), random(255),127.5);
  frameRate(1.5);
}
void draw()
{
  background(255);
  pointLight(random(255), random(255), random(255), random(255), random(255), random(255) );
  while (x < y)
  {
    int offsetX = int(random(0, 500));
    int offsetY = int(random(0, 500));
    translate(offsetX, offsetY, 0);
    box(20);
    translate(-offsetX, -offsetY, 0);
    x++;
  }
  if (x >= y)
  {
    y=2*y;
  }
  if (x> 10000)
  {
    x=1;
    y=1;
  }
}



