
/*
Melissa Alleyne  
Drawing Tool 
Ems II 09/12/2012
Selects a random color
starting from where you click this color will 
do a random walk and color that cell's neighbors and
the neighbors of it's neighbors (randomly as stated before)
losing opacity as it goes. this color will stop when either 
the opacity hits zero or it's off the screen
the size of the current cell being colored will also change
in occordance to outside sound. 
leaves a cool colorful geometric effect
*/
Cell[][] grid;
int cellX, cellY;
float R, G, B;
boolean cellClicked;
float a; 
int numCells;
int cellSize;

void setup() {
  setupAudio();
  size(500, 500);
  background(0);
  smooth();
  numCells = 25;
  noStroke();
  frameRate(60);
  cellClicked = false;
  grid = new Cell[numCells][numCells];
  for(int i = 0; i < numCells; i++) {
    for(int j = 0; j < numCells; j++) {
      grid[i][j] = new Cell(i*width/numCells,j*width/numCells, color(255, 255, 255), width/numCells);
    }  
  }
  stroke(0);
}

void mouseClicked() {
  cellClicked = true;
  R = random(255);
  G = random(255);
  B = random(255);
  cellX = (int)(mouseX/(width/numCells));
  cellY = (int)(mouseY/(width/numCells));
  a = 255;
} 

void draw() {
  getVolume();
  int directionX, directionY;
  if(cellClicked) {
    if(cellX >= 0 && cellX < numCells && cellY >= 0 && cellY < numCells && a > 0) { 
      Cell cell = grid[cellX][cellY];
      cell.changeSize(round(volume));
      if(cell.c == color(255)) {
        cell.changeColor(color(R, G, B, a-=2));
        if(a < 0)
          a = 0;
      }
      directionX = round(random(-1, 1));
      directionY = round(random(-1, 1));
      cellX += directionX;
      cellY += directionY;
    }
  }
}

class Cell {
  int x, y;
  color c;
  Cell(int xpos, int ypos, color rectColor, int cellSize) {
    x = xpos;
    y = ypos;
    c = rectColor; 
    fill(c);
    rect(x, y, cellSize, cellSize);
  }
  
  void changeSize(int cellSize) {
    fill(c);
    rect(x, y, cellSize, cellSize);
  }
  
  void changeColor(color rectColor) {
    c = rectColor;
    fill(c);
    rect(x, y, 20, 20);
  }
}


