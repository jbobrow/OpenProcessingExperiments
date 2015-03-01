
Cell[][] grid; 

// Number of columns and rows in the grid
int cols = 10;
int rows = 10;

void setup() {
  size(400,400);
  grid = new Cell[cols][rows];
  
  // The counter variables i and j are also the column and row numbers
  // In this example, they are used as arguments to the constructor for each object in the grid.
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      // Initialize each object
      grid[i][j] = new Cell(i*40,j*40,40,40,(i +j)/4);
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}
class Cell {

  // A cell object knows about its location in the grid as well as its size with the variables x, y, w, h.
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
    angle += 0.02;
  }
  
  void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(150 + 150*sin(angle),250+250*cos(angle),100);
    rect(x,y,w,h);
  }
}


