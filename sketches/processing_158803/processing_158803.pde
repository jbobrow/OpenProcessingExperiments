
/**
 * Mirror 
 * by Daniel Shiffman.  
 *
 * Each pixel from the video source is drawn as a rectangle with rotation based on brightness.   
 */ 
 
import processing.video.*;


// Size of each cell in the grid
int cellSize = 10;
// Number of columns and rows in our system
int cols, rows;
// Variable for capture device
Capture video;


void setup() {
  size(640, 480);
  frameRate(30);
  cols = width / cellSize;
  rows = height / cellSize;
  colorMode(RGB, 155, 155, 155, 100);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start();  
  
  background(0);
}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
  
    pushMatrix();
    float xx=0;
    float yy=0;
        
    float speedX=0;
        speedX += 91;
        
      translate(speedX,100); 
           rect(200,200,speedX,40); 
         
          popMatrix();
  
    // Begin loop for columns
    for (int i = 0; i < cols; i++) {
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {
      
        // Where are we, pixel-wise?
        int x = i*cellSize; //20
        int y = j*cellSize;
        int loc = (video.width - x - 1) + y*video.width; // Reversing x to mirror the image
      
        float r = red(video.pixels[loc]);
        float g = green(video.pixels[loc]);
        float b = blue(video.pixels[loc]);
        // Make a new color with an alpha component
        color c = color(r, g, b, 5);
      
        // Code for drawing a single rect
        // Using translate in order for rotation to work properly
        pushMatrix();
        
        //fill(200);
          
        translate(x+cellSize/2, y+cellSize/2);
        // Rotation formula based on brightness
        rotate((2 * PI * brightness(c) / 255.0));
        rectMode(CENTER);
        fill(c);
        noStroke();
        // Rects are larger than the cell for some overlap
        ellipse(0, 0, cellSize+5, cellSize+5);
        popMatrix();
      }
    }
  }
}


