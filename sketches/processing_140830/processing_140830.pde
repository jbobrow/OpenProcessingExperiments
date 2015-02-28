

Cell[][] grid;

int cols = 30;
int rows = 30;

int clor;

void setup() {
  size(300,300);
  colorMode(HSB, 700, 100, 100);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*10,j*10,10,10,i+j);
      clor = i;
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < cols; i++) {
      for(int j = 0; j < rows; j++) {
        grid[i][j].display();
       grid[i][j].oscillate();
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
    angle += 0.05;
  }
  
  void display() {
    stroke(0);
    fill(w+x+h+y+abs(100*sin(angle)), 100, 100);
    rect(x, y, w, h);
  }
}
    
    
    



