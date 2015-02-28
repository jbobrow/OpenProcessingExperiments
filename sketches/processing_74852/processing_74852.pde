
//Alex Lim, CP1 mods 4/5, A Hundred Shapes
//www.dizbalex.webs.com
float a = 0;
float b = 0;
float c = 0;
void setup ()
{
  size (500, 500, P3D);
  noStroke ();
  frameRate (20);
}
void draw ()
{
  background (0);
  lights ();
  a = random (0, 50);
  b = random (255);
  c = random (150);
  fill (a, b, c);
  int size = int (random(3, 40));
  int offsetX = int (random(0, 500));
  int offsetY = int (random(0, 500));
  translate (offsetX, offsetY, 0);
  sphere (size);
  translate (-offsetX, -offsetY, 0);
}
