
 
PImage img;       
PImage img2;
PImage img3;
int cellsize = 2; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system


void setup() {
  size(750, 500, P3D); 
  img = loadImage("img1.jpg");  // Load the image
  img2 = loadImage("img2.jpg"); // load it
  img3 = loadImage("img3.jpg"); // load it
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
      float z = (mouseX / float(width)) * brightness(img2.pixels[loc]) - 20.0; // use it
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x + 200, y + 100, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
      stroke(255);  // white
      color myColorWhite = color(255);  // white
      if (img.pixels[loc] == myColorWhite)  // Grab the color
      line (x + 200, y + 100, z , x,y,0); // that you need to figure out 
 }
  }
}



