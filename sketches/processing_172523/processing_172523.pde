
float rotX = 0;
float rotY = 0;

PImage img;

void setup()
{
  size(300, 300, P3D);
  frameRate(100);
}
void draw()
{
  background(0);
  drawEarth();
}
void drawEarth()
{
  translate(150, 150, 0);
  rotateX(rotX);
  rotateY(rotY);
  rotY = rotY+0.05;
  noStroke();
  fill(238,130,238);
  lights();
  pointLight(139, 0, 0, 240, 150, -275);
  pointLight(139, 0, 0, -240, -150, -275);
  sphere(75);
}
