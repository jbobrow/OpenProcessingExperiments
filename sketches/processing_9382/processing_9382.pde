
/**
 * Explode 
 * by Daniel Shiffman. 
remixed by mar_b
 */



 
PImage img;       // The source image
int cellsize = 1; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system



void setup() {
  size(640, 360, P3D); 
  img = loadImage("stars.jpg");  // Load the image
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
}

void draw() {
  background(0);
  
  // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
     // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
    
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*img.width;  // Pixel array location
      color c = img.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX/1.8 / float(width)) * brightness(img.pixels[loc]) * 2.0;
      float b = (mouseY/1.8 / float(height)) * saturation(img.pixels[loc]) * 3.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 200, y + 100, z-b);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}

