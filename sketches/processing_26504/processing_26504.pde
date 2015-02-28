
import processing.video.*;
Capture video;
int pointillize = 20;


void setup() { 
  size(400, 400);
  video = new Capture(this, 400, 400, 30);
  background(255);
  smooth();
}

void draw() { 
  if (video.available()) {
    video.read();
  }
  
  loadPixels(); 
  video.loadPixels(); 

 int x = int(random(video.width));
 int y = int(random(video.height));
 int loc = x + y*video.width;
 
 float r,g,b;
 r = red(video.pixels[loc]); 
 g = green(video.pixels[loc]); 
 b = blue(video.pixels[loc]);
 
      noStroke();
      fill(r, g, b, 100);
      ellipse(x, y, pointillize, pointillize);
    }





