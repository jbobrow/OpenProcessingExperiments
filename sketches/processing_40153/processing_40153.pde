
//Alex Nelson

PImage img;

//setting up the point sizes
int smallPoint = 1;
int largePoint = 20;
int top, right;

void setup() {
  size(300, 300);
  //uploading image and setting and setting the minimum size of the large points
  img = loadImage("Landscape.jpg");
  //image also looks good with the stroke, but the noStroke gives a watercolor look to the image
  noStroke();
  background(0);
  smooth();
  largePoint = min(width, height) / 10;
 }

void draw() { 
  //setting the points to go from small to large as it moves from left to right
  float dotspread = map(mouseX, 0, width, smallPoint, largePoint);
  int x = int(mouseX);
  int y = int(mouseY);
  color pix = img.get(x, y);
  //setting the transparency to about 50%
  fill(pix, 125);
  ellipse(right + x, top + y, dotspread, dotspread);
}


