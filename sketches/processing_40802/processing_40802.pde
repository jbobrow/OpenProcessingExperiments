
//sample crab crab image
PImage img;
int littledot = 16;

void setup(){
  size(400, 400);
  img = loadImage("cutecrab.jpg");
  background(255);
  smooth();
}


void draw(){
  
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  x = constrain(x, 60, width-60);
  y = constrain(y, 60, height-60);
  
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  fill(r, g, b, 100);
  ellipse(x, y, littledot, littledot);
}


