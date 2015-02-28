
PImage bkgnd;
PImage face;
float x;
float y;
float r;

void setup()
{
  size(640,480);
  bkgnd = loadImage("bkgnd.JPG");
  face = loadImage("face.JPG"); 
}
void draw()
{
  background(bkgnd);
  x=abs(469-mouseX);
  y=abs(321-mouseY);
  r=255-sqrt((x*x)+(y*y));
  tint(255,r);
  image(face,0,0);
}

