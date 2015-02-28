

int x = 30;
import processing.video.*;
PFont fontA;
Capture cam;

void setup() {
  size(320, 240);

  
  cam = new Capture(this, 320, 240);
    fontA = loadFont("Verdana-32.vlw");

  textFont(fontA, 32);
}


void draw() {
  if (cam.available() == true) {
    cam.read();
    image(cam, 0, 0);
  
  text("Hello, I love you", x, 130);
  fill(#ffefdf);
  smooth();
   
  }
} 

