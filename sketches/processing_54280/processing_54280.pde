
PImage img;
int pointillize = 16;

void setup(){
  size(500,717);
  img = loadImage("face.jpg");
  background(0);
  smooth();
}

void draw(){
  int x = int (random (img.width));
  int y = int (random (img.height));
  int loc = x+y*img.width;
  loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();
  
  fill(r,g,b,100);
  ellipse(x,y,pointillize,pointillize);
}
