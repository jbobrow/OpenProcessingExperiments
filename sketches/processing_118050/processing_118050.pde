
int rows = 150;
int columns = 150;

// grid we draw
// This is how to define a 2D array (array of arrays)
int[][] grid = new int[columns][rows];

// hold the results of the grid after game of life rules applied each frame
int[][] nextGrid = new int[columns][rows];

void setup()
{
  size(600, 600);
  frameRate(15);
  
  // Loop through every column
  for (int c = 0; c < columns; c += 1)
  {
    // For every row in that column c
    for (int r = 0; r < rows; r += 1)
    {
      // Get a random 0 or 1 value to place in each cell of the grid.
      // More interesting patterns would happen if we had a less 
      // random starting population. 
      
      // Change probability to anything between 0->1 
      // to adjust percentage of grid filled with 1s
      float probability = 0.50; // 50%
      
      // grid[c][r] gets the cell at column c, row r
      // this is how we access the int in the 2d array
      grid[c][r] = (int)(random(0, 1) + probability);
    }
  }
}

void draw()
{
  // smaller transparency creates longer smoke/fade effect
  int transparency = 100; 
  
  // draw black background over the old grid to clear screen
  fill(0,0,0,transparency);
  rect(0,0,width,height);
  
  // Draw grid (could change this to draw the data with something besides rects)
  for (int c = 0; c < columns; c += 1)
  {
    for (int r = 0; r < rows; r += 1)
    {
      // grid[c][r] gets the cell at column c, row r
      // If cell is not dead draw a rect there.
      if (grid[c][r] != 0)
      {
        // Draw rect if grid position is not 0
        float w = (width / columns);
        float h = (height / rows);
        float x = c * w;
        float y = r * h;
        fill(255);
        rect(x, y, w, h);
      }
    }
  }
  
  // Apply the game of life rules to each cell in the grid.
  // Fill nextGrid with the results
  for (int c = 0; c < columns; c += 1)
  {
    for (int r = 0; r < rows; r += 1)
    {
      int neighbors = 0;
      
      // grid[c][r] gets the cell at column c, row r
 
      //------------------
      // Check each side of our current cell against 8 neighbors
      // Don't check if on an edge because our neighbor will not exist.
      // (c >= columns-1, c == 0, r >= rows-1, r == 0)
      //------------------
      
      // right
      if (c < columns-1 && grid[c+1][r] != 0)
      {
        neighbors += 1;
      }
      // left
      if (c > 0 && grid[c-1][r] != 0)
      {
        neighbors += 1;
      }
      // down
      if (r < rows-1 && grid[c][r+1] != 0)
      {
        neighbors += 1;
      }
      // up
      if (r > 0 && grid[c][r-1] != 0)
      {
        neighbors += 1;
      }
      // right up
      if (c < columns-1 && r > 0 && grid[c+1][r-1] != 0)
      {
        neighbors += 1;
      }
      // right down
      if (c < columns-1 && r < rows-1 && grid[c+1][r+1] != 0)
      {
        neighbors += 1;
      }
      // left up
      if (c > 0 && r > 0 && grid[c-1][r-1] != 0)
      {
        neighbors += 1;
      }
      // left down
      if (c > 0 && r < rows-1 && grid[c-1][r+1] != 0)
      {
        neighbors += 1;
      }
      
      //------------------
      // GAME OF LIFE RULES
      //------------------
      if (grid[c][r] == 1) // Alive
      {
        // Any live cell with fewer than two live neighbours dies, 
        // as if caused by under-population.
        if (neighbors < 2)
        {
          nextGrid[c][r] = 0;
        }
        // Any live cell with more than three live neighbours dies, 
        // as if by overcrowding.
        else if (neighbors > 3)
        {
          nextGrid[c][r] = 0;
        }
        // Any live cell with two or three live neighbours 
        //lives on to the next generation. So else no change.
        else
        {
          nextGrid[c][r] = 1;
        }
      }
      else if (grid[c][r] == 0) // dead
      {
        // Any dead cell with exactly three 
        // live neighbours becomes a live cell, as if by reproduction.
        if (neighbors == 3)
        {
          nextGrid[c][r] = 1;
        }
        else // stay dead
        {
          nextGrid[c][r] = 0;
        }
      }
    }
  }
  
  for (int c = 0; c < columns; c += 1)
  {
    for (int r = 0; r < rows; r += 1)
    {
      // Copy the results of our neighbor check into the grid we draw next time.
      grid[c][r] = nextGrid[c][r];
    }
  }
}
