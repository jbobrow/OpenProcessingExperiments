
int[][] grid, futureGrid;

void setup() {
  size(540, 540);
  frameRate(8);
  grid = new int[width][height];
  futureGrid = new int[width][height];
  float density = 0.3 * width * height;
  for (int i = 0; i < density; i++) {
    grid[int(random(width))][int(random(height))] = 1;
  }
  background(255);
}

void draw() {
  for (int x = 1; x < width-1; x++) {
    for (int y = 1; y < height-1; y++) {
      // Check the number of neighbors (adjacent cells)
      int nb = neighbors(x, y);
      if ((grid[x][y] == 1) && (nb < 1)) {
        futureGrid[x][y] = 0; // Isolation death
        set(x, y, color(250,120,10,100));
      } else if ((grid[x][y] == 1) && (nb > 4)) {
        futureGrid[x][y] = 0; // Overpopulation death
        set(x, y, color(80,120,200,100));
      } else if ((grid[x][y] == 0) && (nb == 4)) {
        futureGrid[x][y] = 1; // Birth
        set(x, y, color(220,200,0,100));
      } else {
        futureGrid[x][y] = grid[x][y]; // Survive
      }
      if (x > width-2) {
        x = 1;
      }
      if (y > height-2) {
        x = 1;
      }
    }
  }
  // Swap current and future grids
  int[][] temp = grid;
  grid = futureGrid;
  futureGrid = temp;
}

// Count the number of adjacent cells 'on'
int neighbors(int x, int y) {
  int north = (y + height-1) % height;
  int south = (y + 1) % height;
  int east = (x + 1) % width;
  int west = (x + width-1) % width;
  return grid[x][north] + // North
    grid[east][north] + // Northeast
    grid[east][y] + // East
    grid[east][south] + // Southeast
    grid[x][south] + // South
    grid[west][south] + // Southwest
    grid[west][y] + // West
    grid[west][north]; // Northwest
}



