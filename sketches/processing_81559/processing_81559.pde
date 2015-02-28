
// The next line is needed if running in JavaScript Mode with Processing.js
/* @pjs preload="sea.jpg"; */

PImage img;
int direction = 1;

float signal;

void setup() {
  size(500, 333);
  stroke(255);
  img = loadImage("hawke.jpg");
  img.loadPixels();
  loadPixels();
}

void draw() {
  if (signal > img.height-1 || signal < 0) { 
    direction = direction * -1;
  }
  if (mousePressed == true) {
    signal = abs(mouseY % img.height);
  } 
  else {
    signal += (1*direction);
  }

  if (keyPressed == true) {
    set(0, 0, img);
    line(0, signal, img.width, signal);
  } 
  else {
    int signalOffset = int(signal)*img.width;
    for (int y = 0; y < img.height; y++) {
      arrayCopy(img.pixels, signalOffset, pixels, y*width, img.width);
    }
    updatePixels();
  }
}

