
int[][] grid, futureGrid;
int eraseRadius = 60;
void setup()
{
  size(500,400,P2D);
  noSmooth();
  frameRate(24);
  grid = new int[width][height];
  futureGrid = new int[width][height];
  float density = 0.1 * width * height;
  for(int i = 0; i < density; i++)
  {
    grid[int(random(width))][int(random(height))] = 1;
  }
  background(0);
}

void draw()
{
  for(int x = 1; x < width -1; x++)
  {
    for(int y = 1; y < height - 1; y++)
    {
      int range = 5;
      int nb = neighbors(5, x, y);
      if((grid[x][y] == 1) && (nb < round(range - 5)))
      {
        futureGrid[x][y] = 0;
        set(x,y,color(0,0,0));
      }
      else if ((grid[x][y] == 0) && (nb == round(range)))
      {
        futureGrid[x][y] = 1;
        set(x,y,color(255));
      }
      else if((grid[x][y] == 1) && (nb > range + 6))
      {
        futureGrid[x][y] = 0;
        set(x,y,color(0));
      }
      else if((grid[x][y] == 2))
      {
         futureGrid[x][y] = 1;
         set(x,y,color(255));
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

void mouseDragged()
{
  for(int x = mouseX - eraseRadius; x < mouseX + eraseRadius; x++)
  {
    for(int y = mouseY - eraseRadius; y < mouseY + eraseRadius; y++)
    {
      int sx = constrain(x, 1, width -1);
      int sy = constrain(y, 1, height -1);
      grid[sx][sy] = 2;
      set(sx, sy, color(255));
    }
    
  }
  
}


