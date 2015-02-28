
//Alex Lim, CP1 mods 4/5, User Input
//www.dizbalex.webs.com
float a;
float b;
float c;
float d;
int x = 0;
int y = 0;
int w = 0;
int xChange = 1;
int yChange = 1;

void setup ()
{
  fill (0, 0, 0);
  smooth ();
  frameRate (50);
  size (500, 500);
}
void draw ()
{
  a = random (0, 70);
  b = random (255);
  c = random (255);
  d = random (0, 100);
  noStroke ();
  fill (a, b, c, d);
  ellipse (mouseX, mouseY, pmouseX, pmouseY);
  ellipse (500-mouseX, 500-mouseY, pmouseX, pmouseY);
}
