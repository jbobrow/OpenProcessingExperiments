

import codeanticode.gsvideo.*;

GSCapture video;

void setup() {
  size(640, 480, P3D);
  
  video = new GSCapture(this, width, height);
  video.start();
  
  smooth();
}

void draw() {
  background(255);
  if(video.available()) {
    video.read();
  }
  video.loadPixels();
  
  float totalbrightness = 0;
  
  for(int i = 0; i < video.pixels.length; i++) {
    color c = video.pixels[i];
    totalbrightness += brightness(c);
  }
  
  float avgBrightness = totalbrightness/video.pixels.length;
  float theta = 0.0;
  
  for(int x = 0; x <= video.width; x += 5) {
    float y = width/2 + (sin(theta) *avgBrightness);
    rect(x, y, 2, 4);
    
    theta += PI/40.0;
  }
  
  println(avgBrightness);
}

