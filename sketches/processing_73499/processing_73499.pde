
// Alex Lim, CP1 mods 4/5, Rotating Cube
//www.dizbalex.webs.com
float rot = 0;
float a;
float b;
float c;
void setup ()
{
  fill (0, 0, 0);
  size (500, 500, P3D);
  smooth ();
  noStroke ();
}
void draw ()
{
  a = random (0, 110);
  b = random (255);
  c = random (200);
  fill (a, b, c, 200);
  background (0);
  frameRate (50);
  lights ();
  camera (mouseX, mouseY, 350, 0, 0, 0, 0, 1, 0);
  rotateX (rot*5);
  rot = rot + .05;
  rotateY (1);
  translate (0, 100, 0);
  box (175);
}
