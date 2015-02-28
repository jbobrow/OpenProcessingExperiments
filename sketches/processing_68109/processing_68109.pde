
/*
Nattinee Srikasumbun
nsri2842
 */ 
 
 
import processing.video.*;
import processing.video.*;
MovieMaker myMovie;

// Size of each cell in the grid
int cellSize = 20;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;
int Mouse_Number;

void setup() {
  size(640, 480, P2D);
  frameRate(30);
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 255, 255, 255, 100);

  // Uses the default video input, see the reference if this causes an error
  video = new Capture(this, width, height, 12);
  
  background(0);
  myMovie = new MovieMaker(this, width, height, "capture.mov", 25, MovieMaker.H263,
MovieMaker.BEST);
}


void draw() { 
  myMovie.addFrame();
  if (video.available()) {
    video.read();
    video.loadPixels();
    
    // Not bothering to clear background
    // background(0);
  
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
      
        // Where are we, pixel-wise?
        int x = i*cellSize;
        int y = j*cellSize;
        int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
      
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        // Make a new color with an alpha component
        color c = color(r, g, b, 75);
      
        // Code for drawing a single rect
        // Using translate in order for rotation to work properly
        pushMatrix();
        translate(x+cellSize/2, y+cellSize/2);
        // Rotation formula based on brightness
        rotate((2 * PI * brightness(c) / 255.0));
        rectMode(CENTER);
        fill(c);
        noStroke();
        // Rects are larger than the cell for some overlap
        rect(0, 0, cellSize+Mouse_Number, cellSize+Mouse_Number);
        popMatrix();
      }
    }
  }
}

void mouseDragged() {
    Mouse_Number   = (int) map( mouseX, 0, width, -128, 128 );
}

void keyPressed() {
  if (key == ' ') {   // If we press spacebar...
    myMovie.finish(); // Stop recording
} }
void stop() {
  myMovie.finish();
  super.stop();
}

