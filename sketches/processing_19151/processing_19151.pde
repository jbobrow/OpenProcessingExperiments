
PImage img;
int points = 10;

void setup() {
  size(400,400);
  img = loadImage("IMG.jpg");
  background(255);
  smooth();
}

void draw() {

  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;

  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);

  noStroke();
  fill(r,g,b,100);
  ellipse(x,y,points,points); 
}


