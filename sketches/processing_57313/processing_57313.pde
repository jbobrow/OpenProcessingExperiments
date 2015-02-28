
PImage cacophony;

int cellsize = 4; // Dimensions of each cell in the grid
int columns, rows;   // Number of columns and rows in our system

void setup() {
  size(900, 695, P3D); 
  cacophony = loadImage("cacophony.JPG");  // Load the image

    columns = cacophony.width / cellsize;  // Calculate # of columns
  rows = cacophony.height / cellsize;  // Calculate # of rows
frameRate = 65;
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
  fill (random(125), random(53), random(62), random(255));
  ellipse (random(40), random(40), 50, 50); 
  ellipse (random(850), random(40), 50, 50);
  
  ellipse (random(40), random(655), 50, 50);
  ellipse (random(850), random(655), 30, 50);
  
  
  
  
  //fill (255, 0, 0);
  //rect (mouseX, mouseY, mouseX+50, mouseY+75);
  //line(200, 200, ouse X, mouse Y);

}

int value = 0;


void mousePressed() {
color c1 = color(255, 0, 0, 75);

noStroke();
fill(c1);
rect(0, 0, 900, 695);
}  

