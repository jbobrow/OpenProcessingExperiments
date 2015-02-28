
float x = .2;
float z = 0;
void setup()
{
  size(300, 300, P3D);
  background(0);
  noStroke();
  smooth();
}
void draw()
{
  translate(mouseX, mouseY, 0);
  pointLight(14, 3, 176, -137, -147, 354);
  lights();
  rotateZ(z);
  rotateX(x);
  background(0);
  box(60);
  frameRate(12);
  z = z + .2;
  x = x - .2;
}

