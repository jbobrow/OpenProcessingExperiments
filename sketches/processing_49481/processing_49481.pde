
PImage img;	

void setup() {
  size(600,600);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("bubble.png");
}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)
  image(img,mouseX,300);
}

