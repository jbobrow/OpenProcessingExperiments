

Cell[][] grid;

// Number of columns and rows in the grid
int cols = 50;
int rows = 50;

void setup() {
  size(900,900);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*60,j*20,40,60,i+j);
    }
  }
}

void draw() {
  background(134,89,190);
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
    x = tempX/4;
    y = tempY*2;
    w = tempW*20;
    h = tempH;
    angle = tempAngle;
  } 
  
  // Oscillation means increase angle
  void oscillate() {
    angle += 0.02*mouseY/50; 
  }

  void display() {
    stroke(162,183,96);
    strokeWeight(6);
    // Color calculated using sine wave
    fill(127+127*sin(angle));
    rect(x,y,mouseX,mouseY);
    
  }
}


