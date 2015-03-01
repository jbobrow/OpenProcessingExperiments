
int[][] grid, futureGrid;

//two-dimensional CA. Rules are defined by neighboring cells in two dimensions
//each cell has 8 neighboring cells  north, northeeast, east, southeast, west, southwest, west, northwest
//can i keep the cells from dying?!

void setup() {
  size(800, 240);
  frameRate(4);
  grid = new int[width][height];
  futureGrid = new int[width][height];
  float density = 0.1 * width/2 * height;
  for (int i = 0; i < density; i++) {
    grid[int(random(width))][int(random(height))] = 1; //place a living cell there, want it to be one
  }
  background(0);
}

void draw() {
  for (int x = 1; x < width - 1; x++) {
    for (int y = 1; y < height - 1; y++) {
      // Check the number of neighbors (adjacent cells)
      int nb = neighbors(x, y);
      if ((grid[x][y] == 1) && (nb < 2)) {
        futureGrid[x][y] = 0; // Isolation death
        set(x, y, color(0));
      } else if ((grid[x][y] == 1) && (nb > 3)) {
        futureGrid[x][y] = 0; // Overpopulation death
        set(x, y, color(0));
      } else if ((grid[x][y] == 0) && (nb == 3)) {
        futureGrid[x][y] = 1; // Birth
        set(x, y, color(255));
      } else {
        futureGrid[x][y] = grid[x][y]; // Survive
      }
    }
  }

  // Swap current and future grids
  int[][] temp = grid;
  grid = futureGrid;
  futureGrid = temp;
}

// Count the number of adjacent cells 'on'  
//it's either +1 or -1
int neighbors(int x, int y) {
  return grid[x][y+1] +
         grid[x][y-1] + 
         grid[x+1][y] + 
         grid[x-1][y] + 
         grid[x+1][y+1] + 
         grid[x-1][y-1] + 
         grid[x-1][y+1] + 
         grid[x-1][y-1]; 
}



