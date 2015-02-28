
// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 25;
int rows = 25;
int rotating = 0;

void setup() {
  
  size(800,800);
  background(150);
  frameRate(10);
  int rotating;
  rotating = 0;
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw() {
  background(130);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
 if (!keyPressed){rotating += 5;}
 translate(400,400);
 rotate(radians(rotating));
 rotate(TWO_PI);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
    noFill();
  stroke(130);
  strokeWeight(180);
  //ellipse(0,0,600,600);
  noStroke();
  fill(130);
  ellipse(0,0,300,300);
  fill(255);
  ellipse(0,0,5,5);
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
    angle += 0.25; 
  }

  void display() {
    noStroke();
    // Color calculated using sine wave
    fill(127+127*sin(angle));
    ellipse(x-250,y-250,w,h); 
  }
}
 


