
//Webcam capture for game jam

import processing.video.*;

Capture cam;
PFont f;

void setup() {
  size(1280, 720);
  cam = new Capture(this, 1280, 720, 60);
  cam.start();
  
  f = createFont("Arial", 16, true);
}

void savePic(){
  save(str(day()) + str(hour()) + str(minute()) + ".png");
}

void draw() {
  if(cam.available()) {
    cam.read();
  }
  image(cam, 0, 0);
  textFont(f, 16);
  fill(0);
  text(str(hour()) + ":" + str(minute()) + "  " + str(second()), 20, 20);
  if( second() == 0 ){
    savePic();
  }
}
