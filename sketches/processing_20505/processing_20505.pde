
import processing.video.*;

Capture cam;

void setup() {
  size(300, 300);
  cam = new Capture(this, 300, 300);
  noStroke();
  smooth();
  colorMode(HSB, 50);
  frameRate(15);
}

int cell = 10; 

void draw() {

  if (cam.available() == true) {
    background(0);
    cam.read();
    cam.loadPixels();
    for(int y=cell-10; y <= 299; y+=cell) {    
      for(int x=cell-10; x <= 299; x+=cell) {
        float gradient = cell * (brightness(cam.pixels[x + (y * 300)]) /10);
        fill(gradient*2);
        rect(x+random(1,10),y+random(1,10),gradient,gradient);
      }
    }
  }
} 


