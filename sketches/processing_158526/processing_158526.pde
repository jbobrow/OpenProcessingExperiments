
// 2D Array of objects
Cell[][] grid;
PFont oscilationFont;

// Number of columns and rows in the grid
int cols = 10;
int rows = 10;

void setup() {
  size(300,300);
  oscilationFont = createFont("Verdana",20,true);
  textFont(oscilationFont,14);
 
  
  
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
      fill(250);
      text("Hello there!",220,200);

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
  
  void oscillate() {
    angle += 0.1; 
  }

  void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(127+127*sin(angle));
    rect(x,y,w,h); 
  }
}



