
// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 20;
int rows = 20;




void setup() {
  size(800,600,P3D);
  frameRate(30);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*30,j*50,120,60,i+j);
    }
  }
}

void draw() {
  background(0);
  // The counter variables i and j are also the column and row numbers and 
  // are used as arguments to the constructor for each object in the grid.  
  for (int i = 0; i < cols; i++) {
    for (int j = 8; j < rows; j++) {
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
    angle += 0.02; 
  }

  void display() {
      
    stroke(15,199,247);
    //smooth();
    
    //pushMatrix();    
    
    
    box(x,y,w); 
    fill(65+150*sin(angle),170+50*cos(angle+0.2),150+69*sin(angle+0.2),25);
    
    translate(50,-50);
   rotate(sin(angle)/PI, cos(angle)+1, sin(angle)/2, sin(angle)/PI);
  
   //popMatrix();
    

  }
}

