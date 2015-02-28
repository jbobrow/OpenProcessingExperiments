

PImage img;
int sz = 8;

void setup() {
  frameRate(600);
  size(800,600);
  img = loadImage("painting.jpg");
  background(255);
  smooth();
  noStroke();

}

void draw() {

  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));

  int index = x + y*img.width;

  // Look up the RGB color in the source image
  loadPixels();
  float r = red(img.pixels[index]);
  float g = green(img.pixels[index]);
  float b = blue(img.pixels[index]);
  //brigthness of pixel
  float br = brightness(img.pixels[index]);

  // Draw an ellipse at that location with that color
  filter(GRAY);
  fill(r,g,b,br);
  ellipse(x,y,sz,sz);
  
}
 

