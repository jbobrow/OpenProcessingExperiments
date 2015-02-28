
import processing.video.*;

color black = color(0);
color red = color(255,0,0);
color green = color(0,255,0);
int count = 0;
int numPixels;
Capture video;


void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  strokeWeight(5);
  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 24);
  numPixels = video.width * video.height;
  noCursor();
  smooth();
  
}

void draw() {
  if(video.available()) {
    video.read();
    video.loadPixels();
    int threshold = 75;
    float pixelBrightness;
    loadPixels();
    for(int i =0; i<numPixels; i++) {
      pixelBrightness = brightness(video.pixels[i]);
      if(pixelBrightness<threshold) {
        pixels[i] = green;
      } else {
        pixels[i] =red;
      }
      }
    }
    updatePixels();
  }


