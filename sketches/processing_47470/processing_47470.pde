
PImage img;
 
int smallPoint = 90;
int largePoint;
int top, left;
 
void setup() {
  size(454,389);
  img = loadImage("DSC_0094.JPG");
  //img = loadImage("DSC_0094.JPG");  // an alternative image
  noStroke();
  background(250);
  smooth();
  largePoint = min(width, height) / 10;
  // center the image on the screen
  left = (width - img.width) / 2;
  top = (height - img.height) / 5;
}
 
void draw() {
  float pointillize = map(mouseX, 3, width, smallPoint, largePoint);
  int x = int(random(img.width));
  int y = int(random(img.height));
  color pix = img.get(x, y);
  fill(pix, 100);
  rect(left + x, top + y, pointillize, pointillize);
}


