
boolean[][] cells = new boolean[50][100];
boolean[] roolset = new boolean[8];

void setup() {
  size(600, 200);
  frameRate (30);
  noSmooth();
  setRandomCells();
  setRuleset();
  background(255);
}

void draw() {
   background(#57385c);

  updateCA();
  showCA();
}

void showCA() {
  noStroke();
  float stepsX = width / (float) cells[0].length;
  float stepsY = height / (float) cells.length;
  int i = 0;
  while (i < cells.length) {
    float y = stepsY * i;
    int j = 0;
    while (j < cells[i].length) {
      float x = stepsX * j;
      if (cells[i][j] == true) {
        fill(#57385c);
      } 
      else {
        fill(#ffedbc);
      }

      rect(x, y, stepsX, stepsY);
      j = j + 1;
    }
    i = i + 1;
  }
}

void updateCA() {
  int i = 0;
  while (i < cells.length - 1) {
    arrayCopy(cells[i + 1], cells[i]);
    i = i + 1;
  }
  newGeneration();
}

void newGeneration() {
  int i = cells.length-1;
  int j = 0;

  boolean c1;
  boolean c2;
  boolean c3; 
  while (j < cells[i].length) {

    if (j == 0) {
      c1 = cells[i][cells[i].length - 1];
    } 
    else {
      c1 = cells[i][j - 1];
    }
    c2 = cells[i][j];

    if ( j == cells[i].length - 1) {
      c3 = cells[i][0];
    } 
    else {
      c3 = cells[i][j + 1];
    }

    if (c1 && c2 && c3) {
      cells[i][j] = roolset[0];
    } 
    else if (c1 && !c2 && c3) {
      cells[i][j] = roolset[1];
    } 
    else if (c1 && c2 && !c3) {
      cells[i][j] = roolset[2];
    } 
    else if (c1 && !c2 && !c3) {
      cells[i][j] = roolset[3];
    } 
    else if (!c1 && c2 && c3) {
      cells[i][j] = roolset[4];
    } 
    else if (!c1 && !c2 && c3) {
      cells[i][j] = roolset[5];
    } 
    else if (!c1 && c2 && !c3) {
      cells[i][j] = roolset[6];
    } 
    else {
      cells[i][j] = roolset[7];
    }
    j = j + 1;
  }
}

void setRuleset() {
  int i = 0;
  while (i < roolset.length) {
    roolset[i] = bRandom();
    i = i + 1;
  }
}

void setRandomCells() {
  int i = 0;
  while (i < cells.length) {
    setRandomCellRow(i);
    i = i + 1;
  }
}

void setRandomCellRow(int row) {
  int j = 0;
  while (j < cells[row].length) {
    cells[row][j] = bRandom();
    j = j + 1;
  }
}

boolean bRandom() {
  float dice = random(0, 100);
  if (dice < 50) {
    return true;
  } 
  else {
    return false;
  }
}

void mousePressed() {
  setRandomCellRow(cells.length - 1);
  setRuleset();
}

