
PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  size(579,600,P3D);
  img = loadImage( "barbie.jpg" ); // Load the image
  cols = width/cellsize;              // Calculate # of columns
  rows = height/cellsize;             // Calculate # of rows
  background (0);
 frameRate(32);
  
}

void draw() {
  background(0);
  img.loadPixels();
   fill(20, 20, 20, 20);
    //nostroke();
    //stroke (255,0,0);
    //smooth();
    //strokeweight (10); //width of border
    rect(0, 0, width, height);

    //(elipse) x, y, width, height):
    fill(150);
    //fill (red,green, blue);
    //0=no color 255=max
    // the last number is the opacity
    ellipse (random (0, width), random (0, height), 20, 35); 

  // Begin loop for columns
  for (int i = 0; i < cols; i++ ) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++ ) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color

      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX/(float)width) * brightness(img.pixels[loc])- 100.0;

      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x,y,z); 
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0,0,cellsize,cellsize);
      popMatrix();

    }
  }
}

