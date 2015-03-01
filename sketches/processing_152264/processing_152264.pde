
int r = 10;
int val = 400/r;
float hue;

Cell[][] cells = new Cell[val][val];

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);
  frameRate(3);

  hue = random(360);

  for (int i = 0; i < val; i++) {
    for (int j = 0; j < val; j++) {
      cells[i][j] = new Cell(i, j, r, hue);
    }
  }
}

void draw() {
  background(360);

  for (int p = 0; p < val; p++) {
    for (int q = 0; q < val; q++) {
      lifeChecker(p, q);
    }
  }

  for (int i = 0; i < val; i++) {
    for (int j = 0; j < val; j++) {
      cells[i][j].display();
    }
  }
}

void lifeChecker(int i, int j) {
  int near_life = 0;
  boolean skip_flg_p = false;
  boolean skip_flg_m = false;

  if (i == 0) {
    skip_flg_m = true;
  }
  if (i == val-1) {
    skip_flg_p = true;
  }

  //8 life counter
  if (j != 0) {
    if (skip_flg_m == false && cells[i-1][j-1].life == true) {
      near_life++;
    }
    if (cells[i][j-1].life == true) {
      near_life++;
    }
    if (skip_flg_p == false && cells[i+1][j-1].life == true) {
      near_life++;
    }
  }
  if (skip_flg_m == false && cells[i-1][j].life == true) {
    near_life++;
  }
  if (skip_flg_p == false && cells[i+1][j].life == true) {
    near_life++;
  }
  if (j != val-1) {
    if (skip_flg_m == false && cells[i-1][j+1].life == true) {
      near_life++;
    }
    if (cells[i][j+1].life == true) {
      near_life++;
    }
    if (skip_flg_p == false && cells[i+1][j+1].life == true) {
      near_life++;
    }
  }

  //life check
  if (cells[i][j].life == true && near_life == 2) {
    cells[i][j].next_life = true;
  } else if (cells[i][j].life == true && near_life == 3) {
    cells[i][j].next_life = true;
  } else if (cells[i][j].life == false && near_life == 3) {
    cells[i][j].next_life = true;
  } else {
    cells[i][j].next_life = false;
  }
}

void mousePressed() {
  setup();
}

class Cell {
  int num_i;
  int num_j;
  int r;
  boolean life; 
  boolean next_life;
  float hue;

  Cell(int tmpI, int tmpJ, int tmpR, float tmpHue) {
    num_i = tmpI;
    num_j = tmpJ;
    r = tmpR;
    hue = tmpHue;

    if (random(1) >= 0.6) {
      life = true;
    } else {
      life = false;
    }
  }

  void display() {
    stroke(hue, 30, 100);

    if (life == true) {
      fill(hue, 50, 100);
    } else {
      fill(360);
    }
    rect(r*num_i, r*num_j, r, r);

    life = next_life;
  }
}



