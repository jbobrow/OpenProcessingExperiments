
/* @pjs preload= "eye.jpg"; */
PImage eye;

void setup() {
  size(500,500);
  eye = loadImage("eye.jpg");
  eye.loadPixels();
}

void draw() {
  float gray = map(second(), 0, 59, 0, 255);
  color c = color(gray);
  int index = frameCount % (width*height);
  loadPixels();
  pixels[index] = c;
  updatePixels();
}

  



