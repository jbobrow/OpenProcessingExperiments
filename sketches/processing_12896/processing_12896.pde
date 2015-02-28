
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com
// Edited by Jennifer Salcedo

// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 20;
int rows = 30;

void setup() {
  size(360,700);
  frameRate(1);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
  building ();
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
    angle += 0.008; 
  }

  void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(127 + 127*tan(angle), random(255), random(255));
    rect(x,y,w,h); 
  }
}

void building () {
  //first column
    noStroke ();
  fill(0,0,0,200);
  rect (21, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (21, 121, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (21, 201, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (21, 281, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (21, 361, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (21, 441, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (21, 521, 39, 59);
//second column
    noStroke ();
  fill(0,0,0,200);
  rect (81, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (81, 121, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (81, 201, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (81, 281, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (81, 361, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (81, 441, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (81, 521, 39, 59);
//third column
    noStroke ();
  fill(0,0,0,200);
  rect (141, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (141, 121, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 121, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (141, 201, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 201, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (141, 281, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 281, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (141, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 41, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (141, 361, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 361, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (141, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 41, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (141, 441, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 441, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (141, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 41, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (141, 521, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (181, 521, 39, 59);
//fourth column
    noStroke ();
  fill(0,0,0,200);
  rect (241, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (241, 121, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (241, 201, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (241, 281, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (241, 361, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (241, 441, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (241, 521, 39, 59);
//fifth column
    noStroke ();
  fill(0,0,0,200);
  rect (301, 41, 39, 59);
    noStroke ();
  fill(0,0,0,200);
  rect (301, 121, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (301, 201, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (301, 281, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (301, 361, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (301, 441, 39, 59);
      noStroke ();
  fill(0,0,0,200);
  rect (301, 521, 39, 59);
//door
  fill(255);
  rect (181, 640, 30, 90);
  fill(255);
  rect (150, 640, 30, 90);
//awning
  noStroke ();
  fill(100);
  rect (0, 601, 600, 20);
}

