
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
  size(400,200);
  noStroke();
  background(10026677);
  smooth();
}

void draw()
{ 
  float pointillize = map(mouseX, 0, width, 9, 122);
  int y = int(random(a.width));
  int x = int(random(a.height));
  color pix = a.get(x, y);
  fill(pix, 126);
  ellipse(x, y, pointillize, pointillize);
}

