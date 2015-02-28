
int gridX = 5;
int gridY = 5;
int[][] grid = new int[gridX][gridY];
float cell = 20.0;

int x = 0;
int y = 0;
int ox = 0;
int oy = 0;

float delay = 0.0;
float interval = 0.0;

boolean[] keys = new boolean[256];
int keysDown = 0;

void setup() {
  size(440,440);
  smooth();
  rectMode(CENTER);
  x = 0; y = 0; grid[x][y] = 2;
  grid[2][2] = 1;
  grid[3][2] = 1;
  grid[4][2] = 1;
  grid[0][2] = 1;
}

void draw() {
  float cx = width/2;
  float cy = height/2;
  background(0); noStroke();
  for(int i = 0; i < 5; i++) {
    for(int j = 0; j < 5; j++) {
      float px = cx - 2*cell + i*cell;
      float py = cy - 2*cell + j*cell;
      if(grid[i][j] == 0) fill(255);
      if(grid[i][j] == 1) fill(0);
      if(grid[i][j] == 2) fill(255,0,0);
      rect(px,py,cell,cell);
    }
  }
  if(interval == 0.0) {
    if(keys[39] && x+1 != ox) {
      ox = x;
      oy = y;
      x = min(x+1, 4);
      if(grid[x][y] == 1) {x = ox; y = oy;}
      if(x != ox) {
        if(grid[x][y] == 2) grid[x][y] = 0;
        else grid[x][y] = 2;
      }
      interval = 0.1;
    }
    if(keys[37] && x-1 != ox) {
      ox = x;
      oy = y;
      x = max(x-1, 0);
      if(grid[x][y] == 1) {x = ox; y = oy;}
      if(x != ox) {
        if(grid[x][y] == 2) grid[x][y] = 0;
        else grid[x][y] = 2;
      }
      interval = 0.1;
    }
    if(keys[40] && y+1 != oy) {
      ox = x;
      oy = y;
      y = min(y+1, 4);
      if(grid[x][y] == 1) {x = ox; y = oy;}
      if(y!=oy) {
        if(grid[x][y] == 2) grid[x][y] = 0;
        else grid[x][y] = 2;
      }
      interval = 0.1;
    }
    if(keys[38] && y-1 != oy) {
      ox = x;
      oy = y;
      y = max(y-1, 0);
      if(grid[x][y] == 1) {x = ox; y = oy;}
      if(y!=oy) {
        if(grid[x][y] == 2) grid[x][y] = 0;
        else grid[x][y] = 2;
      }
      interval = 0.1;
    }
  }
  delay += interval;
  if(delay >= 1.0) {
    delay = 0.0;
    interval = 0.0;
  }
}

void keyPressed() {
  if(!keys[keyCode]) keysDown++;
  keys[keyCode] = true;
}

void keyReleased() {
  keysDown--;
  keys[keyCode] = false;
}
