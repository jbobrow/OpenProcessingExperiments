
int worldWidth = 100;
int worldHeight = 40;
int cellSize = 5;
int[][] myCells = new int[worldWidth][worldHeight];
 
void setup() {
  size(500, 200);
  for (int i = 0; i < worldWidth; i++) {
    for (int j= 0; j < worldHeight; j++) {
      myCells[i][j] = (int)random(300) % 2;
      //println(myCells[i][j]);
    }
  }
  //noStroke();
  //frameRate(1);
}
 
void draw() {
 
  int x=0;
  int y=0;
  for (int i = 0; i < worldWidth; i++) {
    for (int j= 0; j < worldHeight; j++) {
      if (myCells[i][j] == 1) {
        fill(255);
      }
      else {
        fill(0);
      }
      rect(i*cellSize, j*cellSize, cellSize, cellSize);
    }
  }
 
  automata();
}
 
void automata() {
  int[][] temp = new int[worldWidth][worldHeight];
 
  for (int i = 0; i < worldWidth; i++) {
    for (int j = 0; j < worldHeight; j++) {
      if (myCells[i][j] == 1 && neighbors(i,j) < 2) {
        temp[i][j] = 0;
      } else if (myCells[i][j] == 1 && neighbors(i,j) > 3) {
        temp[i][j] = 0;
      } else if (myCells[i][j] == 0 && neighbors(i,j) == 3) {
        temp[i][j] = 1;
      } else {
        temp[i][j] = myCells[i][j];
      }
    }
  }
   
  for (int i = 0; i < worldWidth; i++) {
    for (int j= 0; j < worldHeight; j++) {
      myCells[i][j] = temp[i][j];
    }
  }
 
}
 
int neighbors(int i, int j) {
  int result = 0;
  if (i>0 && j>0 && myCells[i-1][j-1] == 1) {
    result = result + 1;
  }
  if (i>0 && myCells[i-1][j] == 1) {
    result = result + 1;
  }
  if (i>0 && j<worldHeight-1 && myCells[i-1][j+1] == 1) {
    result = result + 1;
  }
  if (j>0 && myCells[i][j-1] == 1) {
    result = result + 1;
  }
  if (j<worldHeight-1 && myCells[i][j+1] == 1) {
    result = result + 1;
  }
  if (i<worldWidth-1 && j>0 && myCells[i+1][j-1] == 1) {
    result = result + 1;
  }
  if (i<worldWidth-1 && myCells[i+1][j] == 1) {
    result = result + 1;
  }
  if (i<worldWidth-1 && j<worldHeight-1 && myCells[i+1][j+1] == 1) {
    result = result + 1;
  }
  return result;
}



