
// Shela H. One Hundred Repeating Shapes, CP1. mods 16-17

/* @pjs globalKeyEvents="true"; */

int a=1;

void setup()
{
  size(600,500,P3D);
  smooth();
  background(0);
  noStroke();
}

void draw()
{
  lights();
  while(a<=100)
  {
  fill(random(255),random(255),random(255));
   int size = int(random(2,40));
  int offsetX = int(random(0,600));
  int offsetY = int(random(0,500));
  translate(offsetX,offsetY,0);
sphere(size);
translate(-offsetX,-offsetY,0);
a++;
  }
}

void mousePressed()
{
  a=1;
  background(0);
}
