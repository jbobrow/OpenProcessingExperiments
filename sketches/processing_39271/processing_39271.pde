
PImage img;       // The source image
int cellsize = 4; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system
float zoom = 800.0;
boolean goingUp = false;

void setup() {
  size(500, 615, P3D); 
  img  = loadImage("picture.png"); // Load the image
  cols = width/cellsize;             // Calculate # of columns
  rows = height/cellsize;            // Calculate # of rows
}

void draw() {
  if (goingUp) {
    zoom += 1;
    if (zoom >= 800) {
      goingUp = false;
    }
  }
  if (!goingUp) {
    zoom -= 1;
    if (zoom <= 0) {
      goingUp = true;
    }
  }
  background(0);
  loadPixels();
  // Begin loop for columns
  for ( int i = 0; i < cols;i++) {
    // Begin loop for rows
    for ( int j = 0; j < rows;j++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (zoom/(float)width) * 3 * brightness(img.pixels[loc]) - 100.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x, y, z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
  }
}


