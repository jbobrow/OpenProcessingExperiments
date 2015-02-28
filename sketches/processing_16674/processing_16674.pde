
import cc.arduino.*;
import processing.serial.*;

// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 13-10: Two-dimensional array of objects

// 2D Array of objects
Cell[][] grid; 

int c = 0;
int i = 0;

// Number of columns and rows in the grid
int cols = 8;
int rows = 8;

import processing.video.*;

int videoScale = 8;

Serial port; 


//int cols, rows;

Capture video;

void setup() {
  size( 64,64 );
  grid = new Cell[cols][rows];

  video = new Capture(this,cols,rows,30);

  // The counter variables i and j are also the column and row numbers
  // In this example, they are used as arguments to the constructor for each object in the grid.
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,i + j);
    }
  }
  println("available serial ports:");
  println(Serial.list());

  port = new Serial(this, Serial.list()[1], 9600);
}


void draw() {
  // Read image from the camera
  if (video.available()) {
    video.read();
  }
  video.loadPixels();

  // Begin loop for columns
  for (int i = 0; i < cols; i++) {
    // Begin loop for rows
    for (int j = 0; j < rows; j++) {
      grid[i][j].display();
      println(grid[i][j].value);


      // Where are we, pixel-wise?
      int x = i*videoScale;
      int y = j*videoScale;


      // Looking up the appropriate color in the pixel array
      //color c = video.pixels[i + j*video.width];
      // fill(c);
      //      stroke(0);
      //     rect(x,y,videoScale,videoScale);
    }
  }

  /*
  for (int i = 0; i < video.pixels.length; i++) {
   for (int j = 0; j < video.height; j++) {
   loadPixels();
   int row = floor(i/8);
   int column = j - (8*row);
   //saving things to the 2D array I made
   //for loop for the cells
   //going to have to go through the cells, grab the median brightness, send it to arduino
   port.write(pixels[i]);
   port.write(pixels[j]);
   port.write(pixels[j+1]);
   
   
   // port.write(pixels[i+1]);
   // port.write(pixels[i+2]);
   */
}



void mouseClicked() {
  for (int i = 0; i < video.pixels.length; i++) {
    for (int j = 0; j < video.height; j++) {
      loadPixels();
      int row = floor(i/8);
      int column = j - (8*row);
      //saving things to the 2D array I made
      //for loop for the cells
      //going to have to go through the cells, grab the median brightness, send it to arduino
      for (row = 0; row < 8; row++) {
        for (column = 0; column < 8; column++) {
 
          println("pixels[column+1]");
          //println(pixels[j]);
        }
      }
    }
  }
}
//  println(pixels[row+1]);


  // port.write(pixels[i+1]);
  // port.write(pixels[i+2]);




/*void draw() {
 background(0);
 for (int i = 0; i < cols; i ++ ) {     
 for (int j = 0; j < rows; j ++ ) {
 // Oscillate and display each object
 grid[i][j].oscillate();
 grid[i][j].display();
 }
 }
 }
 */
