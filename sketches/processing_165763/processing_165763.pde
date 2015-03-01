
import processing.video.*;

Capture cam;

void setup () {
  size(1280, 720);
  cam = new Capture(this, 1280, 720, 15);
  cam.start();
}

void draw() {
  if(cam.available()) {
    cam.read();
  }
  tint(0,200,255);  
  image(cam, 0, 0);
}


