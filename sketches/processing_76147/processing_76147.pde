
//Eric Trinh, DoublingShapes, CP1 mods 16-17
//url: http://ericsprogrammingsite.host22.com/DoublingShapes.html

int n = 2;
int limiter = 1;
//int r = int(random(30, 255));
//int g = int(random(30, 255));
//int b = int(random(30, 255));
void setup()
{
  size(400, 400, P3D);
  lights();
  frameRate(.6);
}
void draw()
{
  background(30);
  fill(int(random(30, 255)), int(random(30, 255)), int(random(30, 255)),20);
  while (n <= limiter)
  {
    int x = int(random(0, 401));
    int y = int(random(0, 401));
    int z = int(random(-400, 100));
    translate(x, y, z);
    box(30);
    translate(-x, -y, -z);
    n++;
  }
  if (n >= limiter)
  {
    limiter*=2;
  }
  if (limiter == 8192*4)
  {
    n = 2;
    limiter = 1;
  }
}
