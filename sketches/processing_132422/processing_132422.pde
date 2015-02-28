
// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 25;
int rows = 25;

void setup() {
  size(400,400);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*16,j*16,16,16,i+j);
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
    if (mousePressed){
    angle += -0.05; 
    } else {
      angle += 0.05;
    }
  }
  void display() {
    // Colors calculated using sine/cos wave
   if (mousePressed) {
    stroke((127+100*cos(angle)), (127+ 150*sin(angle)), 255);
    fill((127+100*cos(angle)), (127+ 150*sin(angle)), 255);
   } else { 
     stroke(255, (127+127*cos(angle)), (127+ 127*sin(angle)));
    fill(255, (127+127*cos(angle)), (127+ 127*sin(angle)));
   } 
   rect(x,y,w,h);
  }
}



