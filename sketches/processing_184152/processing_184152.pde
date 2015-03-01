
Cell[][] grid;

int cols = 10;
int rows = 10;

void setup() {
  size(200,200);
  frameRate(24);
  
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20);
      grid[i][j].display(random(255));
    }
  }
}

void mousePressed(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float nc = random(255);
      grid[i][j].display(nc);
    }
  }
}


void draw() {
    
}


class Cell {
  
  float c;     //color
  float x,y;   // x,y location
  float w,h;   // width and height

  // Cell Constructor
  Cell(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
  } 

  void display(float tempc) {
    c = tempc;    
    stroke(255);
    fill(c);
    rect(x,y,w,h); 
  }
}


