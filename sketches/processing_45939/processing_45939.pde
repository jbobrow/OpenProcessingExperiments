
PImage cacophony;   // The source image

int cellsize = 2; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system

void setup() {
  size(2013, 1514, P3D); 
  cacophony = loadImage("CACOPHONY.JPG");  // Load the image
    columns = cacophony.width / cellsize;  // Calculate # of columns
  rows = cacophony.height / cellsize;  // Calculate # of rows
}

void draw() {
  background(0);
  // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*cacophony.width;  // Pixel array location
      color c = cacophony.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX / float(width)) * brightness(cacophony.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 0, y + 0, z);
      fill(c, 204);
      noStroke();
  
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}


