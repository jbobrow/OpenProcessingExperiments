

Cell[][] grid;


int cols = 50;
int rows = 50;

void setup() {
  size(500,500);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      grid[i][j] = new Cell(i*20,j*20,20,20,i+j);
    }
  }
}

void draw() {
  background(255);

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
    angle += 0.008; 
  }

  void display() {
    stroke(20);
    // Color calculated using sine wave
    fill(10*50*sin(angle));
    rect(x,y,mouseX,mouseY); 
  }
}


