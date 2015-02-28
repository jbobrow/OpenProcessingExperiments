
// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 20;
int rows = 20;


void setup() {
  size(400,400);
  colorMode(HSB, 100);

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
}

// A Cell object
class Cell {
  // A cell object knows about its location in the grid as well as its size with the variables x,y,w,h.
  float x,y;   // x,y location
  float w,h;   // width and height
  float angle; // angle for oscillating brightness
  float mouseValue;
  float mouseFactor=1; // inreased by mouse position
  float mouseFactorDecrease = random(0.95,0.98); // decrease per step

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
    // calculate mouseFactor
    mouseFactor = 70/( abs(x+10-mouseX) + abs(y+10-mouseY) + .0001);
    mouseValue = mouseFactorDecrease*mouseValue+mouseFactor;
    if ( mouseValue > 9000 ) {
      mouseValue = 9000; }
  
  }

  void display() {
    stroke(255);
    // Color calculated using sine wave
    fill(mouseValue%100,100,100,100);
    ellipse(x+10,y+10,2 + w*mouseValue/500,2 + h*mouseValue/500); 
  }
}


