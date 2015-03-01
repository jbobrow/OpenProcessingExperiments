
float x;
float y;
PImage img; 

void setup() {
  size (500, 500);
  img = loadImage("timzarras9.png");
  background(0);
  frameRate(1000);
}
void mousePressed() {
  background(0);
}
void draw() {
  int x = int(mouseX);
  int y = int(mouseY);
  int location = x + y*height;
  loadPixels();
  float r = red(img.pixels[location]);
  float g = green(img.pixels[location]);
  float b = blue(img.pixels[location]);
  noStroke();
  fill(r, g, b, 255);
  rectMode(CENTER);
  rect(x, y, 20, 20);
}



