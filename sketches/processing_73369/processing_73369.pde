
//Jonathan Huang, CP1, mods 16-17

float x = +.5;
float y = -.5;
float z = +.5;
void setup()
{
  size(500, 500, P3D);
}
void draw()
{
  translate (250, 250, 0);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  background(0);
  stroke(0, 255, 0);
  pointLight(random(255), random(255), random(255), random(255), random(255), random(255) );
  box(100);
  stroke(0,255,0);
  translate(125,125,0);
  sphere(15);
  translate(-250,-250,0);
  sphere(15);
  stroke(0,0,255);
  translate(-125,-125,0);
  box(32);
  translate(500,500,0);
  box(32);
  x = x - .03;
  y = y + .03;
  z = z - .03;
}
