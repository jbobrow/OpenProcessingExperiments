
import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);
  cam = new Capture(this, width, height, 30);
  cam.start();
  
}

int x = 0;
void draw() {
  if (cam.available()) {
    cam.read();
  }
  fill(0, 10);
  rect(0, 0, width, height);
   //cam.filter(INVERT);

  for (int x = 0; x<cam.width; x += 10) {
    for (int y=0; y<cam.height; y += 10) {
      color c = cam.pixels[y*cam.width+x];
      stroke(c);
      //line(x*6-3, y*6-3, x*6+3, y*6+3);
      strokeWeight(random(0.1, 10.));
      ellipse(x, y, random(1, 25), random(1, 25));

    }
  }
}

