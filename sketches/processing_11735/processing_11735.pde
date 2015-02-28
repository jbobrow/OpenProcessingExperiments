

Cell[][] grid;


int cols = 200;
int rows = 100;

void setup() {
  size(600,600);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {

      grid[i][j] = new Cell(i*90,j*40,40,80,i+j);
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
    angle += 0.2; 
  }

  void display() {
    stroke(0);

    fill(127*127 * tan(angle));
    rect(x,y,w,h); 
  }
}


