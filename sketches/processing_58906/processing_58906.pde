


int pointillize = 16;

import processing.video.*;
Capture vid;

void setup() {
  frameRate(500);
  size(640, 480);
  vid = new Capture(this, width, height, 500);
}
void captureEvent(Capture vid) {
  vid.read();
}

void draw() {
  int x = int(random(vid.width));
  int y = int(random(vid.height));
  int loc = x + y*vid.width;

  loadPixels();
  float r = red(vid.pixels[loc]);
  float g = green(vid.pixels[loc]);
  float b = blue(vid.pixels[loc]);
  noStroke();
  
 
  fill(r,g,b,100);
  
  ellipse(x,y,pointillize,pointillize);
}



