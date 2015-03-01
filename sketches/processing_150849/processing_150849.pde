
import processing.video.*;
Capture camera;
int ti = 0;

void setup() {
  size(1280/2, 960/2);
  camera = new Capture(this, width, height);
  camera.start(); 
  smooth();
  noStroke();
  background(0);
}

void draw() {
  //background(0);
  ti++;
  if (camera.available()) { 
    camera.read(); 
  } 
  camera.loadPixels();
  int d = 5;
  for(int y = d / 2 ; y < height ; y += d) {
    for(int x = d / 2 ; x < width ; x += d) {
      fill(camera.pixels[y * width + x],5);
      rect(x + 1 - d/2, y + 1 - d/2, d - 2, d - 2);
    }
  }
} 
