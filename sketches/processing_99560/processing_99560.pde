
Cell[][] grid;
int cols;
int rows;

void setup() {
  noStroke();
  size(500,500);
  cols = width/20;
  rows = height/20;
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j].oscillate();
      grid[i][j].display();
    }
  }
}

class Cell {
  float x,y;
  float w,h;
  float angle;
  Cell(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  } 
    void oscillate() {
    angle += 0.3; 
  }

  void display() {
    fill(random(255),127+127*sin(angle/10),127+127*sin(angle/10));
    rect(x,y,w,h); 
  }
}
