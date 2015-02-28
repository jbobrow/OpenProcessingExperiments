
PImage img;  

void setup() {
  // Images must be in the "data" directory to load correctly
  size(300,350);
  img = loadImage("steffen.jpg");
 }

void draw() {
  background(0);
  image(img, 0,0);
}

