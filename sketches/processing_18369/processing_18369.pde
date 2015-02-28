
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Example 15-15: 2D image mapped to 3D
// Adapted by Alec Morrison, October 2010

PImage img;       // The source image
int cellsize = 1; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
float delta= 0.0;
int timer = 0;

void setup() {
  img = loadImage( "textured_logo.jpg" ); // Load the image
  size(500,149,P3D);
  cols = width/cellsize;              // Calculate # of columns
  rows = height/cellsize;             // Calculate # of rows
}

void draw() {
  background(255);
  img.loadPixels();

  // Begin loop for columns
  for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color

      // Calculate a z position as a function of pixel brightness
      float z =  brightness(img.pixels[loc]) * delta;

      // Translate to the location, set fill and stroke, and draw the square
      pushMatrix();
      translate(x,y,z); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();

    }
  }
  delta += 0.01;
}

