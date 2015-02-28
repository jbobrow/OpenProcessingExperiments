
//William T., Rotating Cube, CP1 Mods 14-15
float x = -10;
float y = 0;
float z = 0;
float cube = 0;
void setup()
{
  size (600, 600, P3D);
}
void draw()
{
  background(0);
  cubedrop();
  rotateY(-y);
  translate(0, 300-x, 0);
  pointLight(255, 255, 255, -300, 0, 500);
  rotateY(y);
  body();
  test();
  y = y + 0.2;
  x = x + 3;
  z = z + 0.1;
  if (x >= 650)
  {
    x = -10;
  }
}
void body()
{
  fill(255, 182, 193);
  sphere(125);
}
void test()
{
  box(150);
}
void cubedrop()
{
  fill(random(0, 256), random(0, 256), random(0, 256));
  translate(300, x, 0);
  rotateY(y);
  box(20);
}
