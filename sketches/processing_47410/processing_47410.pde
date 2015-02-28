

int grid_width = 30;
int grid_height = 30;

int draw_grid_width = 10;
int draw_grid_height = 10;

int [][] cur_grid;
int [][] next_grid;
int [][] tmp_grid;
int [][] grid_0 = new int[grid_width][grid_height];
int [][] grid_1 = new int[grid_width][grid_height];

int numGenerations;

void setup() {
  size((draw_grid_width * grid_width), (draw_grid_height * grid_height), P2D);
  init_grid();
  print_grid(cur_grid);
}

void init_grid() {
  
  cur_grid = grid_0;
  next_grid = grid_1;
  
  clear_grid(cur_grid);
  clear_grid(next_grid);

  int n = (int) random(10);

  for (int i=0; i<n; i++) {    
    make_blinker(cur_grid, (int)random(10, 20), (int)random(10,20));
  }
  
  n = (int) random(10);
  for (int i=0; i<n; i++) {
    make_glider(cur_grid, (int)random(10, 20), (int)random(10, 20));
  }
}

void draw() {
  frameRate(15);
  
  check_board(cur_grid, next_grid);

  print_grid(cur_grid);  

  tmp_grid = cur_grid;
  cur_grid = next_grid;
  next_grid = tmp_grid;

  clear_grid(next_grid);
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    init_grid();
  }
}

void clear_grid(int[][] g) {
  for (int x=0; x<grid_width; x++) {
    for (int y=0; y<grid_height; y++) {
      g[x][y] = 0;
    }
  }
}


void print_grid(int[][]g) {
  int xx, yy;
  for (int y=0; y<grid_height; y++) {
    yy = y * draw_grid_width;
    for (int x=0; x<grid_width; x++) {
      xx = x * draw_grid_width;
      if (g[x][y] == 1) {
        fill(255, 0, 0);
      }
      else {
        fill(0, 0, 0);
      } 
      rect(xx, yy, draw_grid_width, draw_grid_height);
    }
  }
}

void print_grid_ascii(int[][] g) {
  int xx, yy;
  for (int y=0; y<grid_height; y++) {
    for (int x=0; x<grid_width; x++) {
      if (g[x][y] == 1) {
        print("1 ");
      }
      else {
        print("0 ");
      }
    }
    println("");
  }

  println("");
}

int check_adj(int[][] g, int x, int y) {
  int n = 0;

  for (int xpos=x-1; xpos <= x+1; xpos++) {
    for (int ypos=y-1; ypos <= y+1; ypos++) {

      if (xpos < 0) {
        break;
      }
      if (xpos >= grid_width) {
        break;
      }
      if (ypos < 0) {
        break;
      }
      if (ypos >= grid_height) {
        break;
      }

      if (!((xpos == x) && (ypos == y)) && (g[xpos][ypos] == 1)) {
        n++;
      }
    }
  }

  return n;
}

int get_neighbours_alive(int[][] g, int x, int y) {

  int [] ox = { 
    -1, 0, 1, -1, 1, -1, 0, 1
  };
  int [] oy = { 
    -1, -1, -1, 0, 0, 1, 1, 1
  };

  int n = 0;

  for (int i=0; i<8; i++) {

    int gx = x + ox[i];
    int gy = y + oy[i];

    if (gx < 0) {
      gx = grid_width - 1;
    }
    if (gx == grid_width) {
      gx = 0;
    }
    if (gy < 0) {
      gy = grid_height - 1;
    }
    if (gy == grid_height) {
      gy = 0;
    }

    if (g[gx][gy] == 1) {
      n++;
    }
  }

  return n;
}

void check_board(int[][] g0, int[][] g1) {
  for (int y=0; y<grid_height; y++) {
    for (int x=0; x<grid_width; x++) {
      int alive = get_neighbours_alive(g0, x, y);
      if (g0[x][y] == 1) {
        if (alive == 2 || alive == 3) {
          g1[x][y] = 1;
        }
        else {
          g1[x][y] = 0;
        }
      }
      else {
        if (alive == 3) {
          g1[x][y] = 1;
        }
      }
    }
  }
}

void make_blinker(int[][] g, int x, int y) {
  g[x][y] = 1;
  g[x][y+1] = 1;
  g[x][y+2] = 1;
}

void make_glider(int[][] g, int x, int y) {
  cur_grid[x][y] = 1;
  cur_grid[x+1][y+1] = 1;
  cur_grid[x-1][y+2] = 1;
  cur_grid[x][y+2] = 1;
  cur_grid[x+1][y+2] = 1;
}


