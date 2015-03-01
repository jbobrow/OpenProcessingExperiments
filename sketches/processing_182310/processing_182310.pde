
int cellsize = 4;
int cellnum = 128;
int[][] spin = new int[cellnum][cellnum];
float beta = 0.44; //critical point = 0.44
float p, E;

void setup() {
  size(cellsize*cellnum, cellsize*cellnum);
  frameRate(100);
  noStroke();
  for (int i = 0; i < cellnum; i++) {
    for (int j = 0; j < cellnum; j++) {
      spin[i][j] = 2*int(random(2))-1;
    }
  }
}

void draw() {
  for (int i = 0; i < cellnum; i++) {
    for (int j = i%2; j < cellnum; j += 2) {
      p = random(1);
      E = spin[i][nextcell(j)]+spin[i][previouscell(j)]+spin[nextcell(i)][j]+spin[previouscell(i)][j];
      if (p < exp(beta*E)/(exp(beta*E)+exp(-beta*E))) {
        spin[i][j] = 1;
      } else {
        spin[i][j] = -1;
      }
    }
  }
  for (int i = 0; i < cellnum; i++) {
    for (int j = (i+1)%2; j < cellnum; j += 2) {
      p = random(1);
      E = spin[i][nextcell(j)]+spin[i][previouscell(j)]+spin[nextcell(i)][j]+spin[previouscell(i)][j];
      if (p < exp(beta*E)/(exp(beta*E)+exp(-beta*E))) {
        spin[i][j] = 1;
      } else {
        spin[i][j] = -1;
      }
    }
  }

  for (int i = 0; i < cellnum; i++) {
    for (int j = 0; j < cellnum; j++) {
      if (spin[i][j] == 1) {
        fill(255, 0, 0);
      } else {
        fill(0, 0, 255);
      }
      rect(cellsize*i, cellsize*j, cellsize, cellsize);
    }
  }

  int sum = 0;
  for (int i = 0; i < cellnum; i++) {
    for (int j = 0; j < cellnum; j++) {
      sum += spin[i][j];
    }
  }
  
  println(sum/pow(cellnum,2));
}

int nextcell(int i) {
  if (i+1 >= cellnum) {
    return 0;
  } else {
    return i+1;
  }
}

int previouscell(int i) {
  if (i <= 0) {
    return cellnum-1;
  } else {
    return i-1;
  }
}
