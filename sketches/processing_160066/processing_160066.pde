

import processing.video.*;
Capture cam;
void setup() {
  size(640, 480);
  colorMode(HSB);
  noFill();
    cam = new Capture(this, Capture.list()[3]);
    cam.start();     
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  color k= cam.get(width/2,height/2);
  float brillo= brightness(k);
  if(brillo<100){
    stroke(random(255),random(255),255);
    triangle(275,250,320,150,370,250);
  }
}

