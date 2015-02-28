
// Declaring a variable of type PImage
PImage img;
int pointillize = 16;
//int imgx=524, imgy=479;
//String imgname="sleepingchild";	

void setup() {
  size(1242,478);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("jaewoong.jpg");
  background(0);
  smooth();
}

//float x, y;

void draw() {
  // Pick a random point
  image(img,0,0);
  for (int i=0; i<100; i++) {
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
  ellipse(x+636,y,pointillize,pointillize);
  }
}

void mousePressed() {
  save("jaewoong.tif");
  setup();
}
  


