
int[][] grid, futureGrid;
void setup()
{
  size(400,400);
  noSmooth();
  frameRate(24);
  grid = new int[width][height];
  futureGrid = new int[width][height];
  float density = 0.8 * width * height;
  for(int i = 0; i < density; i++)
  {
    grid[int(random(width))][int(random(height))] = 1;
  }
  background(255,127,0);
}

void draw()
{
  for(int x = 1; x < width -1; x++)
  {
    for(int y = 1; y < height - 1; y++)
    {
      int range = round(random(4)+1);
      int nb = neighbors(5, x, y);
      if((grid[x][y] == 1) && (nb < 2 ))
      {
        futureGrid[x][y] = 0;
        set(x,y,color(0));
      }
      else if ((grid[x][y] == 0) && (nb == range * 2 + 3))
      {
        futureGrid[x][y] = 1;
        set(x,y,color(255 - x *.125,0,0));
      }
      else if((grid[x][y] == 1) && (nb > range * 2 + 3))
      {
        futureGrid[x][y] = 0;
        set(x,y,color(random(50)+50,0,0));
      }
      else
      { 
        futureGrid[x][y] = grid[x][y];
      }
    }
  }
  int [][] temp = grid;
  grid = futureGrid;
  futureGrid = temp;
}

int neighbors(int range,int x, int y)
{
  int total = 0;
  for(int i = 1; i < range; i++)
  {
    int north = (y + height - i) % height;
    int south = (y + i) % height;
    int east = (x + i) % width;
    int west = (x + width - i) % width;
    total += grid[x][north] +
      grid[east][north] +
      grid[east][y] +
      grid[east][south] +
      grid[x][south] +
      grid[west][south] +
      grid[west][y] +
      grid[west][north];
  }
  return total;
}


