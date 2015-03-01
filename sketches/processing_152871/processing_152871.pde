
/*
 * Creative Coding
 * Week 4, 03 - one pixel cinema
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * Adapted from the above and code from http://processing.org/tutorials/2darray/
 *
 */
 
/* @pjs preload="morris1.png, morris2.png, morris3.png, morris4.png, morris5.png, morris6.png, morris7.png, morris8.png, morris9.png";
 */

PImage myImg;
String[] myImages = {"morris1.png", "morris2.png", "morris4.png", "morris7.png", "morris3.png", "morris5.png", "morris6.png", "morris8.png", "morris9.png"};
color[] pixelColors;
color[] pixelColors2;
int scanLine;  // vertical position
int imgNum = 0;

// 2D Array of objects
Cell[][] grid;
int cellsize = 40;
int dynsize = 10; // dynamic size for randomised rect cells

// Number of columns and rows in the grid
int cols = 14;
int rows = 14;

void setup() {
  size(515, 560);
  myImg = loadImage(myImages[0]);
  
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*cellsize,j*cellsize,cellsize,cellsize,i+j);
    }
  }

  pixelColors = new color[cols];
  pixelColors2 = new color[rows];
  scanLine = 0;
  smooth(4);
}

void draw() {
  background(0);

  // read the colours for the current scanLine
  for (int i=0; i< cols; i++) {
    for (int j=0; j< rows; j++) {
      pixelColors[i] = myImg.get(20+i*35, scanLine);
      pixelColors2[j] = myImg.get(j*35, scanLine);
    }
  }

  // draw the image
  image(myImg, 0, 0);
  
  // increment image array to load new image every few seconds
  if (frameCount % 240 == 0) {
    imgNum ++;
    if (imgNum > 8) {
      imgNum = 0;
    }
    myImg = loadImage(myImages[imgNum]);    
  }
  
  // increment scan line position every second frame
  if (frameCount % 4 == 0) {
    scanLine ++;
  }

  if (scanLine > height) {
    scanLine = 0;
  }

  // draw circles over where the "scanner" is currently reading pixel values
//  for (int i=0; i<rows; i++) {
//    stroke(255);
//    fill(255);
//    ellipse(20 + i*40, scanLine, 5, 5 );
//  }
  
  // draw the sampled pixels as grid
  for (int i=0; i< cols; i++) {
    for (int j=0; j< rows; j++) {
      noStroke();
      if(i % 2 == 0) {
        fill(pixelColors[i], random(200, 255));
      } else {
        fill(pixelColors2[j], random(200, 255));
      }
      // randomised cells
      rect(i*cellsize-random(15), j*cellsize-random(-5,5), cellsize+random(-dynsize, dynsize), cellsize+random(-dynsize, dynsize));
    }
  }
  
    // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.06; //0.02; 
  }

  void display() {
//    stroke(180);
    noStroke();
    // Color calculated using sine wave
//    fill(127+127*sin(angle));
  for (int i=0; i< cols; i++) {
    fill(pixelColors[i], 180*sin(angle));
  }
    rect(x,y,w,h); 
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      dynsize += 5;
    } else if (keyCode == DOWN) {
      dynsize -= 5;
    } 
  }
//  println(dynsize);
}



