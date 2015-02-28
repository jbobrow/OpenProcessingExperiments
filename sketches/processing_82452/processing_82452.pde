
PImage img;



void setup() {
  size(886,1200);
  img = loadImage("girl2.jpg");
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
  
  // Back to shapes! Instead of setting a pixel, we use the color from a pixel to draw a circle.
   
  noStroke();
  fill(r,g,b, 50);

ellipse(x, y, random(150), random(150));
  ellipse(x, y, random(100), random(100)); 
  ellipse(x, y, random(50), random(50)); 
  ellipse(x, y, random(30), random(30)); 
  ellipse(x, y, random(10), random(10)); 
 


}

