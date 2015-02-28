
/**
 * Explode 
 * by Daniel Shiffman. 
 * 
 * Mouse horizontal location controls breaking apart of image and 
 * Maps pixels from a 2D image into 3D space. Pixel brightness controls 
 * translation along z axis. 
 */
 
PImage img;       // The source image
int cellsize = 120; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system

void setup() {
  size(600, 600, P3D); 
  img = loadImage("Texture8.jpg");  // Load the image
  columns = img.width / cellsize;  // Calculate # of columns
  rows = img.height / cellsize;  // Calculate # of rows    
  
}

void draw() {
  background(0);
  // Begin loop for columns
  stroke(0);
  
  for ( int i = 0; i < columns; i++) {

    
    // Begin loop for rows
    for ( int j = 0; j < rows; j++) {
      
      int x = i*cellsize + cellsize/2;  // x position
      int y = j*cellsize + cellsize/2;  // y position
      int loc = x + y*img.width;  // Pixel array location
      color c = img.pixels[loc];  // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (0 /float(width)) * brightness(img.pixels[loc]) - 20.0;
      // Translate to the location, set fill and stroke, and draw the rect
     
      pushMatrix();
      translate(x, y, z);
      fill(c, 204);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize, cellsize);
      popMatrix();
    }
      for (int c=0;c<2;c++){
      strokeWeight(5);
      noFill();
      stroke(0, 250);
      
      float a1=random(600);
      float a2=random(600);
      float a3=random(600);
      float a4=random(600);
      float a5=random(600);
      float a6=random(600);
      float a7=random(600);
      float a8=random(600);
      //smooth();
      bezier(a1, a2, a3, a4, a5, a6, a7, a8);
     
}
  }
  noLoop();
}

