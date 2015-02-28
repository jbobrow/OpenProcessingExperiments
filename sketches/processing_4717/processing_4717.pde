
  // Learning Procesing 
  // Variation of Explode by Daniel Shiffman. 

 PImage img;       // The source image
 int cellsize = 1; // Dimensions of each cell in the grid
 int columns, rows;   // Number of columns and rows in our system

 void setup() {
  size(800, 600, P3D); 
  img = loadImage("Imagen29.png");  // Load the image
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows
 }

 void draw() {
  background(255);
  // Begin loop for columns
  for ( int i = 0; i < columns; i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*img.width;  // Pixel array location
      color c = img.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX*30 / float(width)) * saturation(img.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 150, y + 100, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
 }

