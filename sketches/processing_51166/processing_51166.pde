
PImage img;
int pointillize = 16;

void setup() {
  size(290,290);
  img = loadImage("james.jpg");
  background(0);
  smooth();
  

}

void draw() {
  loadPixels();
  for(int i=0; i< 10; i++);{
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;
  
  // Look up the RGB color in the source image
 
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  // Draw an ellipse at that location with that color
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);
  
}
}

