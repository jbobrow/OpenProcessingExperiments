
// Midterm  - Wooden mirror
// Gabriela Gutierrez
// October 2010

import processing.video.*;
int videoScale = 6;
int cols, rows;
Capture video;


void setup() {
  size(800,600);
  
  cols = width/videoScale;
  rows = height/videoScale;
  smooth();
  video = new Capture (this, cols, rows, 24);
}


void draw() {
  
  if (video.available()) {
    video.read();
  }

  background(0);
  
  video.loadPixels();
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
    
      int x = i*videoScale;
      int y = j*videoScale;
      
      // mirror effect (flip the x-axis)
      int loc = (video.width - i - 1) + j*video.width;
      
      // look up color in the pixel array
      color c = video.pixels[i + j*video.width];
      
      // what is brightness of the color?
      float howBright = brightness(c);
      
      // map the brightness to a scale 1-5
      float tilePosition = map (howBright, 0, 255, 5, 1);
      
      if (tilePosition <= 1) {
        fill(#FFCC99);
      }
      else if (tilePosition <= 2) {
        fill(#FFCC66);
      }
      else if (tilePosition <= 3) {
        fill(#FF9900);
      }
      else if (tilePosition <= 4) {
        fill(#663300);
      }
      else if (tilePosition <= 5) {
        fill(#330000);
      }

      
      rectMode(CENTER);
      stroke(1);
      rect(x + videoScale/2,y + videoScale/2,videoScale,videoScale);

    
    }  
  }
}

