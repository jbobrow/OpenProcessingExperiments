
//Cristen W, CP1, Mods 16/17, Rotating Cube

float x = 0;
float y = 0;
float x1 = 50;

void setup()
{
  size(400, 400, P3D);
}
void draw()
{
  background(183, 196, 182);
  pointLight(254, 254, 254, 0, 0, 100);
  stroke(12, 154, 167);
  translate(200, 200, 0);
  rotateX(x);
  rotateY(y);
  sphere(80);
  fill(255, 255, 255, 200);
  box(120);
  stroke(255);
  line(150, 0, -150, 0);
  line(0, 150, 0, -150);
  line(0, 0, 150, 0, 0, -150);
  x = x+.005;
  y = y + .03;
}
