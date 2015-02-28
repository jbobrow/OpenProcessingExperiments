
/*
Tutorial de Processing
 By Joan Soler-Adillon
 www.joan.cat
 @jsoleradillon
 
 Adaptat a partir d'un exemple d'Eloi Roma
 */

// Size of cells
int cellSize = 10;

//array of cells
int[][] greenColors;
//limit of greeb below
int minimGreen = 100;

void setup() {
  size (640, 360);
  greenColors = new int[width/cellSize][height/cellSize];
  //initialization of cells
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      int green = int(random (minimGreen, 255));
      greenColors[x][y] = green;
    }
  }
}


void draw() {
  //Draw grid
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      fill(0, greenColors[x][y]+minimGreen, 0);
      rect (x*cellSize, y*cellSize, cellSize, cellSize);
    }
  }

  //iterate
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      greenColors[x][y] = (greenColors[x][y] + 1 ) %(255-minimGreen);
    }
  }
}

void mousePressed() {
   minimGreen = int(map(mouseX,0,width,0,255));
  //re-initialization of cells
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      int green = int(random (minimGreen, 255));
      greenColors[x][y] = green;
    }
  }
}



