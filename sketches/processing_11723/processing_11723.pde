
Cell[][] grid;
int cols = 20;
int rows = 20;

void setup() {
  size(400,400);
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
  
//speed of oscillation
  void oscillate() {
    angle += (mouseX+mouseY)*0.0001; 
  }

  void display() {
    //colour of lines
    stroke(100, 255, 200);
    //colour of squares
    fill(50+50*tan(angle)+(mouseX+mouseY)*0.1,50+50*tan(angle)-mouseX,50+50*tan(angle)-mouseY);
    rect(x,y,w,h); 
  }
  
}


