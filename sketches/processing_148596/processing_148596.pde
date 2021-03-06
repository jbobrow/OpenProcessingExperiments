
//  img = loadImage("00-bonobo-cirrus.jpg");

PImage img;
int pointillize = 60;

void setup() {
  size(1608,1348);
  img = loadImage("IMG_20140317_1939481452.jpg");
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
  fill(r,g,b,10000);
  rect(x,y,pointillize,pointillize);
}


