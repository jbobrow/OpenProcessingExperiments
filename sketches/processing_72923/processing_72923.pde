
// Wendy Chuyi Liu, Gold Fish, Mods 16/17
// http://besttoshow.webs.com/
float x = 0.01;

void setup()
{

  background(0);
  size(400, 400, P3D);
}
void draw()
{
  if (mousePressed == true)
  {
    background(0);
    fill(255, 255, 0);
    translate(200, 200, 0);
    rotateX(-.5 + x);
    rotateY(.5 + x);
    box(100);
    x = x + 0.01;
  }
  else
  {
    background(232, 82, 59);
    fill(72, 232, 59);
    translate(200, 200, 0);
    rotateX(-.3 - x);
    rotateY(.3 - x);
    box(150);
    x = x + 0.01;
  }
}
