
import processing.video.*;
Capture cam;
void setup() {
  size(500, 500);
    cam = new Capture(this, Capture.list()[3]);
    cam.start();     
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  loadPixels();
  for (int i= 0; i<pixels.length; i+=500) {
  color c=pixels[i];
  float brillo = brightness(c);
  if (brillo<50) {
    pixels[i] =color(0,255,0);
  }
  else {
    pixels [i] = color (255, 0, 0);
  }
  }
}
