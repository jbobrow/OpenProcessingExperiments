
PImage img;
int pointillize = 13;
 
void setup() {
  size(300,224);
  img = loadImage("neko.jpg");
  background(255);
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
  fill(r,g,b,130);
  rect(x,y,random(pointillize*2),random(pointillize*2));
}

