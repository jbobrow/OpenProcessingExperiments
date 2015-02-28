
/**
 * Pointillism
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls size of dots. 
 * Creates a simple pointillist effect using ellipses colored
 * according to pixels in an image. 
 * 
 * Updated 27 February 2010.
 */
 
PImage img;

int smallPoint = 90;
int largePoint;
int top, left;

void setup() {
  size(454,389);
  img = loadImage("moca.JPG");
  //img = loadImage("moca.jpg");  // an alternative image
  noStroke();
  background(250);
  smooth();
  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - img.width) / 2;
  top = (height - img.height) / 5;
}

void draw() { 
  float pointillize = map(mouseX, 3, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 100);
  rect(left + x, top + y, pointillize, pointillize);
}





