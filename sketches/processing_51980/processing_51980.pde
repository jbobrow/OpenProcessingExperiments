
private int[][] grid;
private int gridScale;
private int gridWidth;
private int gridHeight;
private int resetCount;

private static final int GRIDMAX = 8;
private static final int RESET = 200;

public void setup() {
  //do not change, this is fixed for LED screens.
  size(512, 160);
  //do not change, this is the refresh rate of LEDs.
  frameRate(8);

  // maybe // Add 2 to prevent weird things happening at the edges
  // maybe // Essentially, there is an extra "hidden" line at each edge
  gridScale = 8;
  gridWidth = width/gridScale;
  gridHeight = height/gridScale;
  grid = new int[gridWidth][gridHeight];

  initializeGrid();

  resetCount = 0;
}

public void draw() {
  background(0); //keep background black (LEDs are brightness based)
  stroke(255,0,0); //LEDs are on the scale of red
  fill(255,0,0);   //LEDs are on the scale of red

  updateGrid();
  drawGrid();
  
  if (resetCount >= RESET) {
    initializeGrid();
    resetCount = 0;
  }
  else {
    resetCount++;
  }
}

private void initializeGrid() {
  for (int x=0;x<gridWidth;x++) {
    for (int y=0;y<gridHeight;y++) {
      grid[x][y] = ((int) random(2))*GRIDMAX;
    }
  }
}

private void updateGrid() {
  int[][] newGrid = new int[gridWidth][gridHeight];
  for (int x=0;x<gridWidth;x++) {
    for (int y=0;y<gridHeight;y++) {
      int count = 0;
      for (int nx = x-1;nx <= x+1;nx++) {
        for (int ny = y-1;ny <= y+1; ny++) {
          if (nx == x && ny == y) {
            continue;
          }
          if (nx < 0 || nx >= gridWidth || ny < 0 || ny >= gridHeight) {
            continue;
          }
          if (grid[nx][ny] == GRIDMAX) {
            count++;
          }
        }
      }
      if (count == 3) {
        newGrid[x][y] = GRIDMAX;
      }
      else if (count == 2 && grid[x][y] == GRIDMAX) {
        newGrid[x][y] = GRIDMAX;
      }
      else if (grid[x][y] > 0) {
        newGrid[x][y] = grid[x][y] - 1;
      }
      else {
        newGrid[x][y] = 0;
      }
    }
  }

  for (int x=0;x<gridWidth;x++) {
    for (int y=0;y<gridHeight;y++) {
      grid[x][y] = newGrid[x][y];
    }
  }
}

private void drawGrid() {
  for (int x=0;x<gridWidth;x++) {
    for (int y=0;y<gridHeight;y++) {
      stroke(255*grid[x][y]/GRIDMAX,0,0);
      fill(255*grid[x][y]/GRIDMAX,0,0);
      /*if (grid[x][y] == GRIDMAX) {
       stroke(255,0,0);
       fill(255,0,0);
       }
       else {
       stroke(0);
       fill(0);
       }*/
      rect(x*gridScale,y*gridScale,gridScale,gridScale);
    }
  }
}


