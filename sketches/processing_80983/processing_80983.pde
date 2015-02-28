
PImage img;
int pointillize = 19;
 
void setup() {
  size(400,400);
  img = loadImage("photo1128.jpg");
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
  fill(r,g,b,100);
  pushMatrix();
      translate(x, y);
      rotate(brightness(x));
      rect(0, 0, brightness(y)/6.0, 2);
      popMatrix();
}


