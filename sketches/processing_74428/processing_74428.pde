
//Eric Trinh, RotatingCube, CP1 mods 16/17
//url: http://ericsprogrammingsite.host22.com/RotatingCube.html

float x = 0;
float y = 0;
float z = 0;
int a = 200;
int b = 200;
int c = 1;
int l = 100;
void setup()
{
  size(400, 400, P3D);
  frameRate(24);
  background(0);
}
void draw()
{
  translate(a, b, c);
  strokeWeight(.2);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  x = x + .05;
  y = y + .02;
  z = z + .06;
  fill(230, 56, 90);
  lights();
  if (l>400)
  {
    l = -l;
  }
  box(10);
  int direction = int(random(5));
  if (direction == 0)
  {
    a = a + 5;
  }
  if (direction == 1)
  {
    a = a - 5;
  }
  if (direction == 2)
  {
    b = b + 5;
  }
  if (direction == 3)
  {
    b = b - 5;
  }
  if (direction == 4)
  {
    c = c + 2;
  }
  if (direction == 5)
  {
    c = c - 5;
  }
}


