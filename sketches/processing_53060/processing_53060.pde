
int cols = 50;
int rows = 50;
Grid cell[][];
int count[][];
int newCell[][];
boolean pause = true;
long generation;

String[] lines;
String[] lines2;
int[] rules = {2,3,3}; //rules for Staying Alive
int[] rules2 = {3,3}; //rules for Coming Alive

String[][] gGun;
String[] input;
int gGunData;

void setup() {
  count = new int[cols][rows];
  newCell = new int[cols][rows];
  size(500, 500);
  background(0);
  stroke(200);
  cell = new Grid[cols][rows];
  frameRate(60);

  input = loadStrings("gGunData.txt");
  gGun = new String[input.length][];
  for (int s = 0; s < input.length; s++) {
    gGun[s] = split(input[s], ',');
  }

  for (int j = 0; j < cols; j++) {
    for (int i = 0; i < rows; i++) {
      cell[j][i] = new Grid(j*10, i*10, 10, 10);
    }
  }
}

void draw() {

  for (int k = 0; k < cols; k++) {
    for (int m = 0; m < rows; m++) {
      if (cell[k][m].state == 1) {
        fill(#C40AA2);
      }
      else {
        fill(255);
      }
      cell[k][m].display();
    }
  }

  if (pause == false) {
    runLife();
  }
}

void mouseReleased() {

  for (int g = 0; g < cols; g++) {
    for (int b = 0; b < rows; b++) {
      if (mouseX <(10*g)+10 && mouseY < (10*b) + 10 && mouseX >(10*g) && mouseY > (10*b))
        if (cell[g][b].state == 1) {
          cell[g][b].state = 0;
          println("You clicked cell: (" + str(g) + "," + str(b) + ") Whose State is: " + str(cell[g][b].state));
        }
        else {
          cell[g][b].state = 1;
          println("You clicked cell: (" + str(g) + "," + str(b)+ ") Whose State is: " + str(cell[g][b].state));
        }
    }
  }
}

void keyReleased() {
  if (key == 'p' || key == 'P') {
    pause = !pause;
    if (pause == true) {
      println("Current Generation: "+ str(generation));
    }
  }

  if (key == 'c' || key == 'C') {
    for (int f=0; f < cols; f++) {
      for (int v = 0; v < rows; v++) {
        cell[f][v].clear();
        newCell[f][v] = 0;
        pause = true;
      }
    }
    println("Clear Grid");
  }

  if (key == 'g' || key == 'G') {
    for (int f=0; f < cols; f++) {
      for (int v = 0; v < rows; v++) {
        cell[f][v].state = int(gGun[v][f]);
        newCell[f][v] = 0;
      }
    }
  }

  if (key == 'r' || key == 'R') {
    for (int a=0; a < cols; a++) {
      for (int z = 0; z < rows; z++) {
        float q = random(0, 2);
        cell[a][z].state = int(q);
      }
    }
  }
}


void runLife() {

  for (int d = 0; d< cols; d++) {
    for (int c = 0; c< rows; c++) {
      if (count[d][c] != -1) {
        if (d+1 < cols && d-1 >=0 && c+1 < cols && c-1 >=0) { //check centre
          count[d][c] = cell[d-1][c-1].state + cell[d-1][c].state + cell[d-1][c+1].state + cell[d][c-1].state + cell[d][c+1].state + cell[d+1][c-1].state + cell[d+1][c].state +cell[d+1][c+1].state;
        }
        else if (d-1<0 && c-1<0) { //check top-left
          count[d][c] = cell[d][c+1].state + cell[d+1][c].state + cell[d+1][c+1].state;
        }
        else if (d-1<0 && c-1>=0 && c+1<cols) { //check left
          count[d][c] = cell[d][c-1].state + cell[d][c+1].state + cell[d+1][c-1].state + cell[d+1][c].state + cell[d+1][c+1].state;
        }
        else if (d-1<0 && c+1>=cols) {//check bottom-left
          count[d][c] = cell[d][c-1].state + cell[d+1][c-1].state + cell[d+1][c].state;
        }
        else if (c-1<0 && d+1<cols && d-1>=0) { //check top
          count[d][c] = cell[d-1][c].state + cell[d-1][c+1].state + cell[d][c+1].state + cell[d+1][c].state + cell[d+1][c+1].state;
        }
        else if (c+1>=cols && d+1 <cols && d-1 >=0) { //check bottom
          count[d][c] = cell[d-1][c].state + cell[d-1][c-1].state + cell[d][c-1].state + cell[d+1][c-1].state + cell[d+1][c].state;
        }
        else if (d+1>=cols && c-1<0) { //check top-right
          count[d][c] = cell[d-1][c].state + cell[d-1][c+1].state + cell[d][c+1].state;
        }
        else if (d+1>=cols && c-1 >=0 && c+1 <cols) { //check right
          count[d][c] = cell[d][c-1].state + cell[d-1][c-1].state + cell[d-1][c].state + cell[d-1][c+1].state + cell[d][c+1].state;
        }
        else if (d+1>=cols && c+1>=cols) { //check bottom-right
          count[d][c] = cell[d-1][c].state + cell[d-1][c-1].state + cell[d][c-1].state;
        }
      }

      if (cell[d][c].state == 1) {
        for (int y = 0; y < rules.length; y++) {
          if (count[d][c] == rules[y] ) {
            newCell[d][c] = 1;
            break;
          } 
          else {
            newCell[d][c] = 0;
          }
        }
      }
      else {
        for (int h=0; h < rules2.length; h++) {
          if (count[d][c] == rules2[h]) {
            newCell[d][c] = 1;
            break;
          }
        }
      }
    }
  }

  for (int w = 0; w<cols; w++) {
    for (int s = 0; s <rows; s++) {
      if (pause == false) {
        cell[w][s].state = newCell[w][s];
        generation ++;
      }
    }
  }
}

class Grid {
  float x;
  float y;
  int w;
  int h;
  int state;

  Grid(float ix, float iy, int iw, int ih) {
    x = ix;
    y = iy;
    w = iw;
    h = ih;
  }

  void display() {
    rect(x, y, w, h);
  }

  void clear() {
    state = 0;
  }
}


