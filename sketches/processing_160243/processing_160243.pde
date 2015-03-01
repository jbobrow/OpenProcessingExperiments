
import processing.video.*;
Capture cam;
void setup() {
  size(640, 360);
  cam = new Capture(this, Capture.list()[3]);

  cam.start();
}
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);

  loadPixels();
  for (int i = 0; i<pixels.length;i+=2) {
    color elpx = pixels[i];
    float brillo = brightness(elpx);
    if (brillo<100) {
      pixels[i]=color(0);
    }
    else {
      pixels[i]=color(random(255),random(255),random9255));
    }
  }
  updatePixels();
}
