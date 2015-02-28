
//Justin L., RotatingCube CP1 Mods 16/17

float x = .5;
float y = -.2;
void setup()
{
  size(700, 700, P3D);
  smooth();
  frameRate(50);
}
void draw()
{
  FirstCube();
  SecondCube();
}
void FirstCube()
{
  background(255);
  translate(mouseX-4, mouseY+66, mouseX+25);
  rotateX(x);
  rotateY(y);
  fill(mouseX*4, mouseY*4, 150);
  box(100);
  lights();
  fill(mouseX-44,mouseY-44,150);
  translate(100, 100, 25);
  rotateX(y);
  rotateY(x);
  sphere(50);
  x = x + .02;
  y = y + .05;
}
void SecondCube()
{
  translate(90, 90, 50);
  rotateX(y);
  rotateY(x);
  fill(mouseY*3, mouseX*3, 9);
  box(50);
}
