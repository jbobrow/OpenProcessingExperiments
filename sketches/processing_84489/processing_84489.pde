
/* 
cellGrid - a Processing sketch by Chris Mealing
January 4, 2013

a cell grid, written as a 2D array with gradient color,
color and cell size vary with mouse position.
click to reverse pattern.
*/

// nominal cell width and height, num cols and rows
// this set give a 1200x900 grid
int cellW = 15;  
int cellH = 15;
int cols = 80;
int rows = 60;
// base colors for the grdient and background
color clrA = color(0, 255, 255);
color clrB = color(0, 0, 255);  
color clrBkgd = color(64, 64, 128);
// limits, so the gradients can be reversed with mouse press
float limitA = 0;  
float limitB = 1;
// 2D array to hold cells
Cell[][] cells = new Cell[rows][cols];


void setup() {
  /*  
  should use dynamic setting as below, but doesn't work for Javascript
  web upload.
    
  size(cols*cellW, rows*cellH);
  
  */
  size(1200, 900); 
  rectMode(CENTER);
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {
      int x = cellW/2 + j * cellW;
      int y = cellH/2 + i * cellH;
      cells[i][j] = new Cell(x, y, cellW, cellH);
    }
  }
}


void draw() {
  background(clrBkgd);
  noStroke();
  // set target point at mouse location (so point is stable for following calcs)
  Point tgt = new Point(mouseX, mouseY);  // could've just used a local x, y
  // find distance to furthest corner, as bsis for scaling
  float maxDist = 0.95 * maxDistance(tgt);  //scaled slightly so it looks better
  // iterate each cell
  for (int i=0; i < rows; i++) {
    for (int j=0; j < cols; j++) {
      // calculate distance from cell to target point
      float tgtDist = dist(tgt.x, tgt.y, cells[i][j].x, cells[i][j].y);
      // scale color based on distance - use lerpColor() not map()!
      color fillClr = lerpColor(clrA, clrB, constrain(map(tgtDist, 0, maxDist, limitA, limitB), 0, 1));
      // scale cell fill size
      float fillSize = constrain(map(tgtDist, 0, maxDist, limitA, limitB), 0, 1);
      // display cells
      cells[i][j].fillCell(fillClr, fillSize, fillSize);
    }
  }
}



// function to find distance to furthest window corner
float maxDistance(Point pt) {
  float a = max(pt.x, width - pt.x);
  float b = max(pt.y, height - pt.y);
  return sqrt(sq(a) + sq(b));  
}


// funtion to reverse size and color gradient whe mouse pressed
void mousePressed() {
  limitA = -limitA + 1;
  limitB = -limitB + 1;
}



  
// a simple point class
class Point {
  int x, y;  // point coordinates
  
  Point(int x_, int y_) {
    x = x_;
    y = y_;
  }
}


// a simple Cell class
class Cell {
  float x, y;  // cell centerpoint
  float w, h;  // cell width and height (often the same)
  
  Cell(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  // method to partially fill cell
  void fillCell(color clr, float fillW, float fillH) {
    fill(clr);
    rect(x, y, fillW * w, fillH * h);
  }
}



