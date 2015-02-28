
class Fiver {

  Fiver(int i, int j) {
    movCont++;

    i = floor((i-340)/(518/largoTablero));
    j = floor((j-40)/(518/largoTablero));

    for (int y = -1; y <= 1; y++) {
      for (int x = -1; x <= 1; x++) {

        if ((i + x < largoTablero) && (i + x  >= 0) && (j + y < largoTablero) && (j + y >= 0)) {
          if ((!(x == y) && !(x == -y)) || ((x == 0) && (y == 0))) {

            if (grid[i+x][j+y] == 3) {
              grid[i+x][j+y] = 2;
            }
            else {
              grid[i+x][j+y] = 3;
            }
          }
        }
      }
    }
  }
}


