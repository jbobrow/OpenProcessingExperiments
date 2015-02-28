
import processing.video.*;

int videoScale = 100;

int cols, rows;

Capture video;

void setup() {
  size(800,600);

  cols = width/videoScale;
  rows = (height/videoScale)/2;
  smooth();

  video = new Capture(this,cols,rows,15);
}

void draw() {
  if (video.available()) {
    video.read();
  }
  background(0);

  video.loadPixels();

  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {

      int x = i*videoScale;
      int y = j*videoScale;

  
      int loc = (video.width - i - 1) + j*video.width;

    
      color c = video.pixels[loc];


      float sz = (brightness(c)/255.0)*videoScale; 
      rectMode(CENTER);
      fill(c);
      noStroke();
      rect(x + videoScale/2,(y + videoScale/2)*2,sz,sz*2);

    }
  }
}


