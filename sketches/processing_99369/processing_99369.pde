
/*
  Tetriminos: I J L O S T Z
  0 = I
  1 = J
  2 = L
  3 = O
  4 = S
  5 = T
  6 = Z
*/
final int gridTemplate[][][][] = {
  {{{0,0,0,0}, // I
    {1,1,1,1},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,1,0},
    {0,0,1,0},
    {0,0,1,0},
    {0,0,1,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {1,1,1,1},
    {0,0,0,0}},
   {{0,1,0,0},
    {0,1,0,0},
    {0,1,0,0},
    {0,1,0,0}}},
  {{{2,0,0,0}, // J
    {2,2,2,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,2,2,0},
    {0,2,0,0},
    {0,2,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {2,2,2,0},
    {0,0,2,0},
    {0,0,0,0}},
   {{0,2,0,0},
    {0,2,0,0},
    {2,2,0,0},
    {0,0,0,0}}},
  {{{0,0,3,0}, // L
    {3,3,3,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,3,0,0},
    {0,3,0,0},
    {0,3,3,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {3,3,3,0},
    {3,0,0,0},
    {0,0,0,0}},
   {{3,3,0,0},
    {0,3,0,0},
    {0,3,0,0},
    {0,0,0,0}}},
  {{{0,4,4,0}, // O
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,4,4,0},
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,4,4,0},
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,4,4,0},
    {0,4,4,0},
    {0,0,0,0},
    {0,0,0,0}}},
  {{{0,5,5,0}, // S
    {5,5,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,5,0,0},
    {0,5,5,0},
    {0,0,5,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,5,5,0},
    {5,5,0,0},
    {0,0,0,0}},
   {{5,0,0,0},
    {5,5,0,0},
    {0,5,0,0},
    {0,0,0,0}}},
  {{{0,6,0,0}, // T
    {6,6,6,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,6,0,0},
    {0,6,6,0},
    {0,6,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {6,6,6,0},
    {0,6,0,0},
    {0,0,0,0}},
   {{0,6,0,0},
    {6,6,0,0},
    {0,6,0,0},
    {0,0,0,0}}},
  {{{7,7,0,0}, // Z
    {0,7,7,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,7,0},
    {0,7,7,0},
    {0,7,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {7,7,0,0},
    {0,7,7,0},
    {0,0,0,0}},
   {{0,7,0,0},
    {7,7,0,0},
    {7,0,0,0},
    {0,0,0,0}}},
  {{{0,0,0,0}, // clear
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}},
   {{0,0,0,0},
    {0,0,0,0},
    {0,0,0,0},
    {0,0,0,0}}}
};

final int gridWidth = 10;
final int gridHeight = 22;
final int gridHidden = 2;
final int gridStartX = 0;
final int gridStartY = 0;

int grid[][];
int rectWidth, rectHeight;

final int maxQueue = 4;
int tetrQueue[];
int queueX;
int queueY;

boolean gameOver = false;

void setup() {
  size (301, 401);
  background(255);
  
  grid = new int[gridWidth][gridHeight];
  
  for (int x = 0; x < gridWidth; x++ ) {
    for (int y = 0; y < gridHeight; y++ ) {
      grid[x][y] = 0;
     }
  }
  
  rectWidth = 20;
  rectHeight = 20;
  queueX = 10 + rectWidth* gridWidth;
  queueY = 10;
  
  tetrQueue = new int[maxQueue];
  for (int i = 0; i < maxQueue; i++) {
    tetrQueue[i] = (int)random(0,7);
  }
}

void draw() {
  renderGrid();
  renderQueue();
}
void renderQueue() {
  for(int y = 0 ; y < 4; y++) {
    for(int x = 0; x < 4; x++) {
      switchFillColor(gridTemplate[tetrQueue[0]][0][y][x]);
      rect(queueX + x*rectWidth, queueY + y*rectHeight, rectWidth, rectHeight);
    }
  }
  for (int i = 1; i < maxQueue; i++){
    for(int y = 0; y < 4; y++) {
      for(int x = 0 ;x < 4; x++) {
        int yi = 100 + (i-1)*(50);
          switchFillColor(gridTemplate[i][0][y][x]);
            rect(rectWidth + queueX+x*(rectWidth/2), yi + (y*(rectHeight/2)), rectWidth/2, rectHeight/2);
      }
    }
  }
  for(int y = 0; y < 4; y++) {
    for(int x = 0 ;x < 4; x++) {
      int yi = (16*rectHeight)-queueY;
      switchFillColor(gridTemplate[7][0][y][x]);
      rect(queueX + x*rectWidth, yi + y*rectHeight, rectWidth, rectHeight);
    }
  }
}
void renderGrid() {
  stroke(100);
  
  for(int x = 0;x < gridWidth; x++) {
    for(int y = 0;y < gridHeight; y++) {
        switchFillColor(grid[x][y]);
        rect(gridStartX + x*rectWidth, gridStartY + (y-gridHidden)*rectHeight, rectWidth, rectHeight);
    }
  }
}  
void switchFillColor(int c) {
  switch (c) {
    case 0: fill(0,0,0); break;
    case 1: fill(0,255,255); break;
    case 2: fill(0,0,255); break;
    case 3: fill(255,165,0); break;
    case 4: fill(255,255,0); break;
    case 5: fill(0,255,0); break;
    case 6: fill(148,0,211); break;
    case 7: fill(255,0,0); break;
    default: fill(255); break;
  }
}
