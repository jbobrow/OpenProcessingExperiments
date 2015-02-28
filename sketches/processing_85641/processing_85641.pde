
Cell[][] grid;
int cols = 36;
int rows = 36;
void setup() {
  size(700,700);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = new Cell(i*20,j*20,20,20,i^3-j^2);
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
    angle += 0.029; 
  }

  void display() {
    stroke(20,80,200);

    fill(200*tan(angle)+79,78*tan(angle)+105,218*tan(angle)+205);
    ellipse(x,y,w,h); 
  }
}


