
Cell[][] grid; 

// Number of columns and rows in the grid
int cols = 30;
int rows = 30;

void setup() {
  size(600,600);
  colorMode(HSB);
  grid = new Cell[cols][rows];
  
  // The counter variables i and j are also the column and row numbers
  // In this example, they are used as arguments to the constructor for each object in the grid.
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20,i + j);
    }
  }
}
