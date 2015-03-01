
Cell cell = new Cell(25, 25);
float P = 0.8; //propability of go straight

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  background(255);
}

void draw() {
  background(255);

  //if (mousePressed == false) {
    cell.update();
    cell.drawMe();
  //} else {
  //  cell.refresh();
  //}
}

class Cell {
  int[][] cellcol = new int[50][50];
  color[][] cellcol2 = new color[50][50];
  int x, y;
  int prex, prey;
  float _noise1 = random(10);
  float _noise2 = random(10);
  float _noise3 = random(10);
  float _noise4 = random(10);
  float _noise5 = random(10);
  float _noise6 = random(10);
  float _noise7, _noise8, _noise9;

  Cell(int X, int Y) {
    for (int i = 0; i <50; i++) {
      _noise4 += .1;
      _noise5 += .1; 
      _noise6 += .1;
      _noise7 = _noise1;
      _noise8 = _noise2;
      _noise9 = _noise3;
      for (int j = 0; j < 50; j++) {
        _noise1 += .1;
        _noise2 += .1; 
        _noise3 += .1;
        cellcol[i][j] = 0;
        cellcol2[i][j] = color(noise(_noise1, _noise4)*255, 
        noise(_noise2, _noise5)*255, noise(_noise3, _noise6)*255);
      }
      _noise1 = _noise7;
      _noise2 = _noise8;
      _noise3 = _noise9;
    }
    x = X;
    y = Y;
    prex = X;
    prey = Y - 1;
    cellcol[x][y] = 1;
  }

  void update() {
    float p = random(1);
    if (x - prex == 1 || x - prex == -49) {
      if (p < P) {
        prex = x;
        prey = y;
        x ++;
      } else if (p > (1+P)/2) {
        prex = x;
        prey = y;
        y ++;
      } else {
        prex = x;
        prey = y;
        y --;
      }
    } else if (x - prex == -1 || x - prex == 49) {
      if (p < P) {
        prex = x;
        prey = y;
        x --;
      } else if (p > (1+P)/2) {
        prex = x;
        prey = y;
        y ++;
      } else {
        prex = x;
        prey = y;
        y --;
      }
    } else if (y - prey == 1|| y - prey == -49) {
      if (p < P) {
        prex = x;
        prey = y;
        y ++;
      } else if (p > (1+P)/2) {
        prex = x;
        prey = y;
        x ++;
      } else {
        prex = x;
        prey = y;
        x --;
      }
    } else if (y - prey == -1|| y - prey == 49) {
      if (p < P) {
        prex = x;
        prey = y;
        y --;
      } else if (p > (1+P)/2) {
        prex = x;
        prey = y;
        x ++;
      } else {
        prex = x;
        prey = y;
        x --;
      }
    }
    if (x == -1) {
      x = 49;
    }
    if (x == 50) {
      x = 0;
    }
    if (y == -1) {
      y = 49;
    }
    if (y == 50) {
      y = 0;
    }
    cellcol[x][y] ++;
  }

  void refresh() {
    for (int i = 0; i<50; i++) {
      for (int j = 0; j<50; j++) {
        cellcol[i][j] = 0;
      }
    }
  }

  void drawMe() {
    for (int i = 0; i <50; i++) {
      for (int j = 0; j < 50; j++) {
        fill(cellcol2[i][j], cellcol[i][j]*100);
        //rect(i*10, j*10, (i+1)*10, (j+1)*10);
        ellipse((i+.5)*10, (j+.5)*10, 10*(1-exp(-0.5*cellcol[i][j])), 10*(1-exp(-0.5*cellcol[i][j])));
      }
    }
  }
}


