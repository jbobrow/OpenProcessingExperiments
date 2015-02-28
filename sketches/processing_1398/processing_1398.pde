
/**
 * Pointillism
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls size of dots. 
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image. 
 */
 
PImage a;

void setup()
{
  a = loadImage("eames.jpg");
  size(2000,200);
  noStroke();
  background(59);
  smooth();
}

void draw()
{ 
  float pointillize = map(mouseX, 9, width, 2000, 12);
  int x = int(random(a.width));
  int y = int(random(a.height));
  color pix = a.get(x, y);
  fill(pix, 200);
  ellipse(x, y, pointillize, pointillize);
}

