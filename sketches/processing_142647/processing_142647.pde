
// Jenny Hsu
// Benjamin Bacon
// Creative Computing SB
// 30 March 2014
//
// Pointillism Tutorial: http://www.processing.org/tutorials/pixels/


PImage img;
int pointillize = 20;

void setup() {
  size(300,300);
  img = loadImage("Rob_color.jpg");
  background(0);
  smooth();
}

void draw() {
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b, 100);
  ellipse(x,y,pointillize,pointillize);
}



