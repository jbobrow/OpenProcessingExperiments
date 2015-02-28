
int gsize = 10, imax = 40, jmax = 40, i0, j0, i1 = imax -1, j1 = imax -1;
boolean[][] wall = new boolean[imax][jmax];//if wall[i][j] is a wall
int[][] distance = new int[imax][jmax];//distance to (i0, j0), 255 by default
float ratio = .3; // of walls/grids
class pair{
  int x,y;
  pair(int xx, int yy){
    x = xx;y = yy;
  }
}
pair[][] from = new pair[imax][jmax];

void setup(){
  size(gsize * imax, gsize * jmax);
  for (int i = 0; i < imax; i ++){
    for (int j = 0; j < imax; j ++){
      wall[i][j] = random(1) < ratio;
    }
  }
  reset();
}

void draw(){
  background(255);
  for (int i = 0; i < imax; i ++){
    for (int j = 0; j < imax; j ++){
      if (wall[i][j]){
        fill(0, 0, 255);
      } else {
        fill(0, 255 - distance[i][j] * 2, 0);
      }
      rect(i * gsize, j * gsize, gsize, gsize);
    }
  }
  path(new pair(i1, j1));
}


//test if distances of non-wall neighbours are > a + 1 (while distance of (i,j) is a).
//if so, make the distance of this neighbour a + 1 and relaunch the test by recurrence.
void find(int i, int j, int a){
  if (!wall[i][j]){
    for (int k = 0; k < 4; k ++){
      //k = 1 to 4, (x, y) traverse neighbour of (i, j)
      int x = k == 0? i - 1: k == 1? i + 1: i;
      int y = k == 2? j - 1: k == 3? j + 1: j;
      
      if (0 <= x && x < imax && 0<= y && y < jmax && distance[x][y] > a + 1) {
        distance[x][y] = a + 1;
        find(x, y, a + 1);
        //note a path (i, j) -> (x, y)
        from[x][y] = new pair(i, j);
      }
    }
  }
}

void path(pair P){
  fill(255 - (distance[j1][j1] - distance[P.x][P.y]) * 2, 0, 0);
  rect(P.x * gsize, P.y * gsize, gsize, gsize);
  if (from[P.x][P.y] != P){
    //go back according to the path noted
    path(from[P.x][P.y]);
  }
}
void mousePressed(){
  int i = mouseX / gsize, j = mouseY / gsize;
  if (keyPressed){
    switch (key){
      case '1':
      i0 = i;
      j0 = j;
      break;
      case '2':
      i1 = i;
      j1 = j;
      break;
    }
  } else {
    wall[i][j] = !wall[i][j];
  }
  reset();
}
void reset(){
  for (int i = 0; i < imax; i ++){
    for (int j = 0; j < imax; j ++){
      distance[i][j] = 255;
      from[i][j] = new pair(i, j);
    }
  }
  wall[i0][j0] = false;
  wall[i1][j1] = false;
  distance[i0][j0] = 0;
  find(i0, j0, 0);
}

