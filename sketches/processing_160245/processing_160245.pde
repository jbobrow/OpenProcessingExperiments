
import processing.video.*;
Capture cam;
void setup() {
  size(640, 480);
  cam = new Capture(this, Capture.list()[3]);
  cam.start();
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  color c = get(width/2, height/2);
  fill(c);
  float brillo = brightness(c);
  if (brillo<100); {
    ellipse(320, 240, 35, 35);
  }
}
