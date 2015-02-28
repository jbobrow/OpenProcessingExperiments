
/**
 * Conway's Game of Life 
 * by Mike Davis. 
 * edited by ErrorbyErrors
 * This program is a simple version of Conway's 
 * game of Life.
 */

int sx, sy; 
int[][][] world;

void setup() 
{ 
  size(500, 360);
  sx = width;
  sy = height;
  world = new int[sx][sy][2]; 

  // Set random cells to 'on' 
  for (int i = 0; i < sx * sy; i++) { 
    world[(int)random(sx)][(int)random(sy)][1] = 1;
  }
} 

void draw() 
{ 
  background(0); 

  // Drawing and update cycle 
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) { 
      if (world[x][y][1] == 1) 
      { 
        world[x][y][0] = 1;
        set(x, y, #FFFFFF);
      } 
      else {
        world[x][y][0] = 0;
      }
    }
  } 
  // Birth and death cycle 
  for (int x = 0; x < sx; x++) { 
    for (int y = 0; y < sy; y++) { 
      int count = neighbors(x, y); 
      if ((world[x][y][1] == 1 && (count == 2 || count == 3)) || (world[x][y][1] == -1 && count == 3)) {
        world[x][y][1] = 1;
      } 
      else
      { 
        world[x][y][1] = -1;
      }
    }
  }
} 

// Count the number of adjacent cells 'on' 
int neighbors(int x, int y) 
{ 
  return world[(x + 1) % sx][y][0] + 
    world[x][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][y][0] + 
    world[x][(y + sy - 1) % sy][0] + 
    world[(x + 1) % sx][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][(y + 1) % sy][0] + 
    world[(x + sx - 1) % sx][(y + sy - 1) % sy][0] + 
    world[(x + 1) % sx][(y + sy - 1) % sy][0];
} 



