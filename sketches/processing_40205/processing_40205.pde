
//Based on http://processing.org/learning/topics/linearimage.html

float signal;
int signalOffset;

PImage img;

void setup() {
  size(300, 300);

  //Draws offset verticals based upon colors of image.

  img = loadImage("Costa Rican Frog.jpg");
  img.loadPixels();
  loadPixels();
}

void draw() {

  int signalOffset = int(signal)*img.height;
  for (int x = 0; x < img.width; x++) {
    arrayCopy(img.pixels, signalOffset, pixels, x*width, img.height);
  }

  updatePixels();
}


