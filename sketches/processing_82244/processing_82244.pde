
//PImage img;
//
//PImage maskImg;
PImage maskImg = createImage(66, 66, ARGB);
int pointillize = 6;
 
void setup() {
  size(200,200);
  maskImg = loadImage("p.jpg");
  background(0);
  smooth();
}
 
void draw() {
  // Pick a random point
  int x = int(random(maskImg.width));
  int y = int(random(maskImg.height));
  int loc = x + y*maskImg.width;
   
  // Look up the RGB color in the source image
  loadPixels();
  float a = alpha(maskImg.pixels[loc]);
  float r = red(maskImg.pixels[loc]);
  float g = green(maskImg.pixels[loc]);
  float b = blue(maskImg.pixels[loc]);
  noStroke();
   
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);
}



