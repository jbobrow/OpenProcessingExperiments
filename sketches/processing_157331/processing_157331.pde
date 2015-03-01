
import processing.video.*;
int cellSize = 9;
int cols, rows;
Capture video;

void setup() {
  size(640, 480);
   frameRate(30);

  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 50);
  rectMode(CENTER);

  video = new Capture(this, width, height);
  video.start();  
  background(0);
}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
    background(255, 31, 251);

    for (int i = 0; i < cols;i++) {
    for (int j = 0; j < rows;j++) {

        int x = i * cellSize;
        int y = j * cellSize;
        int loc = (video.width - x - 1) + y*video.width; 
        color c = video.pixels[loc];
        float sz = (brightness(c) / 255.0) * cellSize;
        fill(255, 255,31);
        noStroke();
        rect(x + cellSize/2, y + cellSize/2, sz, sz);
      }
    }
  }
}
