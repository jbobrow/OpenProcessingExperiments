
PImage img;
int pointillize = 20;
 
void setup() {
  size(290,400);
  img = loadImage("santa.jpg");
  background(255);
  smooth();
  frameRate(300);
}
 
void draw() {
  loadPixels();
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
   
  // Look up the RGB color in the source image
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noFill();
   
  // Draw an ellipse at that location with that color
  stroke(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);
  
  
}


