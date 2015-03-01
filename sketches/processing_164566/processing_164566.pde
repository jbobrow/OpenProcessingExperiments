
// IML 404 Week 6
// October 6 2014 / Deena Khattab

import processing.video.*;
Capture vid;

PImage me;

void setup() {
  size(640,480);
  background(0);
  vid = new Capture(this, width, height);
  vid.start();
  me = loadImage("me.png");
}

void draw() {
  if (vid.available()) {
    vid.read();
  }
  image(vid,0,0,width,height);
  image(me, mouseX, mouseY);
}


