

// 2d arrays to hold current and next generations
int[][] current, next;
// prob of life, 0 < p < 1
float p;
// pause toggle
boolean pause;
// block and border vars: bx cell width in pixels, by cell height in
// pixels, bw border width in pixels
int bx, by, bw;
// grid size: dimensions of the 2d cell arrays
int gn, gm;

void setup() {
  size(500, 500);
  frameRate(10);
  bx = 5;
  by = 5;
  bw = 1;
  gn = int(width/(bx+1));
  gm = int(height/(by+1));
  current = new int[gn][gm];
  next = new int[gn][gm];
  for (int i=0;i<gn;i++) {
    for (int j=0;j<gm;j++) {
      current[i][j] = 0;
      next[i][j] = 0;
    }
  }
  
  // life prob
  p=0.2;
  RandomCells(p);
  pause = false;
}

void draw() {
  background(255);
  DrawCells();
  if (!pause) ConwayStep();
}

void keyPressed() {

  if (key=='c') {
    for (int i=0;i<gn;i++) {
      for (int j=0;j<gm;j++) {
        current[i][j] = 0;
      }
    }
  }
  if (key=='p' || key==' ') {
    pause = !pause;
  }
  if (key=='q') {
    exit();
  }
  if (key=='r') {
    RandomCells(p);
  }
}

void mouseDragged() {
  // block size
  int blockSize = 2; 
  for (int i=int(mouseX/(bx+bw)-blockSize); i<=int(mouseX/(bx+bw)+blockSize); i++) {
    for (int j=int(mouseY/(by+bw)-blockSize); j<=int(mouseY/(by+bw)+blockSize); j++) {
      if (i>=0 && i<gn && j>=0 && j<gm) current[i][j] = 1;
    }
  }
}

void mouseClicked() {
  // block size
  int i=int(mouseX/(bx+bw));
  int j=int(mouseY/(by+bw));
  if (i>=0 && i<gn && j>=0 && j<gm) current[i][j] = 1;
}
void RandomCells(float p) {
  for (int i=0;i<gn;i++) {
    for (int j=0;j<gm;j++) {
      if (random(1)<p) {
        current[i][j] = 1;
      }
    }
  }
}

void DrawCells() {
  noStroke();
  fill(0);
  for (int i=0;i<gn;i++) {
    for (int j=0;j<gm;j++) {
      if (current[i][j]==1) {
        rect(i*(bx+bw), j*(by+bw), bx, by);
      }
    }
  }
}

void ConwayStep() {

  int nbhdSum;

  for (int i=0;i<gn;i++) {
    for (int j=0;j<gm;j++) {
      nbhdSum=NeighborhoodSum(i, j);
      if (nbhdSum<2 || nbhdSum>3) next[i][j]=0;
      if (nbhdSum==3) next[i][j] = 1;
      if (nbhdSum==2) next[i][j] = current[i][j];
    }
  }
  for (int i=0;i<gn;i++) {
    for (int j=0;j<gm;j++) {
      current[i][j] = next[i][j];
    }
  }

}

// compute the neighborhood sum with bounds checking
int NeighborhoodSum(int i, int j) {
  int sum = 0;
  int k, l;
  for (k=i-1;k<=i+1;k++) {
    for (l=j-1;l<=j+1;l++) {
      if (k>=0 && k<gn && l>=0 && l<gm && !(k==i && l==j)) {
        sum+=current[k][l];
      }
    }
  }
  return sum;
}



