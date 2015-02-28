
PImage img;
int pointillize = 4;

void setup() {
  size(200,200);
  img = loadImage("sunflower.jpg");
  background(0);
  smooth();
}

void draw() {
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  color pix = img.pixels[loc];
  int leftLoc = (x-1) + y*img.width;
  color leftPix = img.pixels[leftLoc];
  
  int diff = abs(brightness(pix) - brightness(leftPix));
  
  int transp = map(diff,0,50,0,100);
 // transp = 50;
  
  
  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,transp);
  ellipse(x,y,pointillize,pointillize);
}


