
// Each pixel from the video source is drawn as a rectangle
// with rotation based on brightness
// base from Daniel Shieffman's sketch

import codeanticode.gsvideo.*;

// Size of each cell in the grid
int cellSize = 24;
// Number of columna and rows in our system
int cols, rows;
// Variable for capture device
GSCapture video;

void setup() {
  size(640, 480, P3D);
  frameRate(30);
  cols = width/cellSize;
  rows = height/cellSize;
  colorMode(RGB, 255, 255, 255, 100);
  rectMode(CENTER);
  
  // Use the default video input
  video = new GSCapture(this, width, height);
  video.start();
  background(0, 0, 0);   // Red, Green, Blue
}

void draw() {
  if (video.available()) {
    video.read();
    video.loadPixels();

    // Not bothering to clear background
    // background(0);
    // Begin loop for column
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
        
        // Where are we, pixel-wise?
        int x = i * cellSize;
        int y = j * cellSize;
        int loc = (video.width - x - 1) + y * video.width;
        // Reversing x to mirror the image
        
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        // Make a new color with an alpha component
        color c = color(r, g, b, 75);
        
      /* // Code for drawing a single rect
         // Using translate in order for rotation to work properly
      pushMatrix();
      translate(x + cellSize/2, y + cellSize/2);
      
      // Rotation formula based on the brightness
      rotate((2 * PI * brightness(c)/255.0));
      rectMode(CENTER);
      fill(c);
      noStroke();
      // Rects are largee than the cell for some overlap
      rect(0, 0, cellSize + 6, cellSize + 6);
      popMatrix();*/
      
      // Each rect id colores white with a size determine by brightness
      //color c = video.pixels[loc];
      float sz = (brightness(c)/255.0) * cellSize;
      fill(c);
      noStroke();
      rect(x + cellSize/2, y + cellSize/2, sz, sz);
      }
    }    
  }
}

void keyPressed() {
  if (key == 'S') {
    save("video.jpg");
  } else {
    save("video.jpg");
  }
}

