
int gsize = 20, imax = 20, jmax = 20, i0 = imax - 1, j0 = jmax - 1;
boolean[][] wall = new boolean[imax][jmax];//if wall[i][j] is a wall
int[][] distance = new int[imax][jmax];//distance to (i0, j0), 255 by default
float ratio = .3; // of walls/grids
void setup(){
  size(gsize * imax, gsize * jmax);
  for (int i = 0; i < imax; i ++){
    for (int j = 0; j < imax; j ++){
      wall[i][j] = random(1) < ratio;
    }
  }
}
void draw(){
  background(255);
  resetDistance();
  distance[i0][j0] = 0;
  search(i0, j0, 0);
  for (int i = 0; i < imax; i ++){
    for (int j = 0; j < imax; j ++){
      if (wall[i][j]){
        fill(0, 0, 255);
      } else {
        fill(0, 255 - distance[i][j] * 4, 0);//
      }
      rect(i * gsize, j * gsize, gsize, gsize);
    }
  }
  
}
//test if distances of non-wall neighbours are > a + 1 (while distance of (i,j) is a).
//if so, make the distance of this neighbour a + 1 and relaunch the test by recurrence.
void search(int i, int j, int a){
  if (!wall[i][j]){
    if (i > 0 && distance[i - 1][j] > a + 1) {
      distance[i - 1][j] = a + 1;
      search(i - 1, j, a + 1);
    }
    if (i < imax - 1 && distance[i + 1][j] > a + 1) {
      distance[i + 1][j] = a + 1;
      search(i + 1, j, a + 1);
    }
    if (j > 0 && distance[i][j - 1] > a + 1) {
      distance[i][j - 1] = a + 1;
      search(i, j - 1, a + 1);
    }
    if (j < jmax - 1 && distance[i][j + 1] > a + 1) {
      distance[i][j + 1] = a + 1;
      search(i, j + 1, a + 1);
    }
  }
}
void mousePressed(){
  int i = mouseX / gsize, j = mouseY / gsize;
  if (mouseButton == LEFT){
    wall[i][j] = !wall[i][j];
  } else {
    i0 = i;
    j0 = j;
  }
}
void resetDistance(){
  for (int i = 0; i < imax; i ++){
    for (int j = 0; j < imax; j ++){
      distance[i][j] = 255;
    }
  }
}

