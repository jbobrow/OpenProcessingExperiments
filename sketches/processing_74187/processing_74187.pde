
int s = 0;
int c = 1;
int d = 5;
int e = 8;
float x = 0;
float y = 0;
void setup()
{
  size(800, 600, P3D);
  noStroke();
}
void draw()
{
  frameRate(30);
  background(127);
  s = s + 1;
  translate(mouseX, mouseY, 200);
  pointLight(c,d,e,250,250,250);
  rotateZ(x + 150);
  box(90);
  if (s % 60 == 0)
  {
    c = int(random(50,255));
    d = int(random(50,75));
    e = int(random(50,155));
  }
  if (mousePressed == true )
  {
    x = x + 20;
    y = y - 15;
  }
}
