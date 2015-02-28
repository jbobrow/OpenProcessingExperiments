
PImage img;  

void setup() {
  size(320,240);
  img = loadImage("newcastle.jpg");
}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)
  image(img,0,0);
}



