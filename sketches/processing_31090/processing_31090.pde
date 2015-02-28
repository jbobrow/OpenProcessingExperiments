
/**
 *Just a quick edit for a birthday greeting =D
 *Based on:
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
PFont F;

int smallPoint = 8;
int largePoint;
int top, left;

void setup() {
  size(720,480);
  img = loadImage("wayne.jpg");
  //img = loadImage("sunflower.jpg");  // an alternative image
  noStroke();
  //background(230);
  smooth();
  largePoint = min(width, height) / 20;
  // center the image on the screen
  left = (width - img.width) / 2;
  top = (height - img.height) / 2;

  // Load the font from the sketch's data directory
  F =loadFont("Univers-66.vlw");
  textFont(F, 32);
  fill(90);
  text("Happy B-Day", 40, 300);
  fill(60);
  text("Cami Wayne ", 40, 400);
}

void draw() { 
    

  float pointillize = map(min(mouseX,mouseY), 0, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 128);
  ellipse(left + x, top + y, pointillize, pointillize);
}

