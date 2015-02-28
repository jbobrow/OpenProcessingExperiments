
// Implementation of Conway's Game of Life,
// written by Jakob Thomsen
// (see http://en.wikipedia.org/wiki/Conway's_Game_of_Life)

int count_x;
int count_y;

boolean grid[][][];

int current;

void init_random()
{
  current = 0;

  grid = new boolean[count_x][count_y][2];
  for (int row = 1; row < count_y - 1; row++)
  {
    for (int col = 1; col < count_x - 1; col++)
    {
      grid[col][row][0] = (random(1.0) >= 0.5);
    }
  }
}

void setup()
{
  size(640, 480);
  count_x = 160;
  count_y = 100;
  
  init_random();
}

void draw()
{
  background(255);
  float size_x = float(width) / float(count_x);
  float size_y = float(height) / float(count_y);
  for (int row = 1; row < count_y - 1; row++)
  {
    for (int col = 1; col < count_x - 1; col++)
    {
      int sum = 0;
      sum = sum + (grid[col + 1][row    ][current] ? 1 : 0);
      sum = sum + (grid[col + 1][row + 1][current] ? 1 : 0);
      sum = sum + (grid[col    ][row + 1][current] ? 1 : 0);
      sum = sum + (grid[col - 1][row + 1][current] ? 1 : 0);
      sum = sum + (grid[col - 1][row    ][current] ? 1 : 0);
      sum = sum + (grid[col - 1][row - 1][current] ? 1 : 0);
      sum = sum + (grid[col    ][row - 1][current] ? 1 : 0);
      sum = sum + (grid[col + 1][row - 1][current] ? 1 : 0);

      grid[col][row][1 - current] = grid[col][row][current];

      if (sum < 2 | sum > 3)
      {
        grid[col][row][1 - current] = false;
      }

      if (sum == 3)
      {
        grid[col][row][1 - current] = true;
      }

      float x = float(col) / float(count_x);
      float y = float(row) / float(count_y);

      if (grid[col][row][current])
      { 
        fill(0);
      } 
      else
      { 
        fill(255);
      }

      noStroke();
      rect(col * size_x, row * size_y, size_x, size_y);
    }
  }

  current = 1 - current;
  
  if(mousePressed)
  {
    init_random();
  }
}
