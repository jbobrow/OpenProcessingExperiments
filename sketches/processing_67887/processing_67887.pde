
import processing.video.*;
int videoScale = 2;
int cols, rows;
PImage img;
Capture video;
void setup() {
  size(640,480);
  img = loadImage("1.gif");
  // Initialize columns and rows
  cols = width/videoScale;
  rows = height/videoScale;
  smooth();
  // Construct the Capture object
  video = new Capture(this,cols,rows,15);
}

void draw() {
  if (video.available()) {
    video.read();
  }
  background(random(255));
  video.loadPixels();
  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      float x = i*videoScale;
      float y = j*videoScale;
      // Reversing x to mirror the image
      // In order to mirror the image, the column is reversed with the following formula:
      // mirrored column = width - column - 1
      int loc = (video.width - i - 1) + j*video.width;
      // Each rect is colored white with a size determined by brightness
      color c = video.pixels[loc];
      float sz = (brightness(c)/155.0)*videoScale; 
      rectMode(CENTER);
      fill(random(155));
      noStroke();
      rect(x + videoScale/2,y + videoScale/2,sz,sz);
    }
  }
}

