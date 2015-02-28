
//Ticklish Mullet, Aidan F., Computer Programing 1

PImage b;
PImage g;
float x = 300;
float y = 200;
void setup()
{
  size (800, 800);
  background(255);
  b = loadImage("http://aidaniscool.webs.com/bob.gif");
  g = loadImage("http://aidaniscool.webs.com/god.gif");
}
void draw()
{
  background(0);
  image(g, x, y, 300, 420);
  if (mousePressed == true)
  {
    x = x + random(-10, 10);
    y = y + random(-10, 10);
  }
  else
  {
    background(255);
    image(b, x, y, 300, 420);
  }
}
