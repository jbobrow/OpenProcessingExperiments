
// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 80;
int rows = 80;

void setup() {
  size(400,400);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // row
      grid[i][j] = new Cell(i*5,j*5,5,5,i+j);
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
    angle += 1.2; 
    rotate(mouseY+mouseX)
  }

  void display() {
    stroke(random(RGB));
    // Color calculated using sine wave
    fill(155+155*sin(angle),155+125*cos(angle),255+155*cos(angle));
ellipse(x,y,w,h); 
  }
}
 
                
                                                                
