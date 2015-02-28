
//timer code is from "Mouse Game Example": 
// http://www.openprocessing.org/sketch/74999

int [] [] boxes = new int [100] [100];
int mx;
int my;
int lv = 1;
int timer = 10; 
int timeLast = 0;

void setup() {
  for (int x = 0; x < 10; x += 1) {
    for (int y = 0; y < 10; y += 1) {
      boxes [x] [y] = 0;
    }
  }

  size(500, 500);

  timeLast = second();

  smooth();
  stroke(0);
  strokeWeight(4);
}

void draw() {
  if (timer > 0) {
    game();
  }
}
  
void game(){
  if (second() != timeLast){
    timeLast = second();
    timer -= 1;
  }

  background(50);
  
  
  if (lv == 1) {
    for (int x = 0; x < 2; x += 1) {
      for (int y = 0; y < 2; y += 1) {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) {
          mx = floor(mouseX/250);
          my = floor(mouseY/500);

          boxes [mx] [my] = 1;
        }
        if (boxes [x] [y] != 0) {
          fill(190, 10, 10);
        }
        else {
          fill(0, random(150, 160), random(255));
          lv = 1;
        }
        rect(x*250, y*500, 250, 500);
      }
      if (boxes [0][0] == 1 && boxes [1][0] == 1) {
        lv = 2;
      }
    }
  }

  if (lv == 2) {
    for (int x = 0; x < 10; x += 1) {
      for (int y = 0; y < 10; y += 1) {
        boxes [x] [y] = 0;
      }
    }
    lv = 3;
  } 

  if (lv == 3) {
    for (int xx = 0; xx < 4; xx += 1) {
      for (int yy = 0; yy < 4; yy += 1) {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) {
          mx = floor(mouseX/250);
          my = floor(mouseY/250);

          boxes [mx] [my] = 2;
        }
        if (boxes [xx] [yy] != 0 ) {
          fill(190, 10, 10);
          lv = 4;
        }
        else {
          fill(0, random(150, 160), random(255));
          lv = 3;
        }
        rect(xx*250, yy*250, 250, 250);
      }
      if (boxes [0][0] == 2 && boxes [1][0] == 2 && boxes [0][1] == 2 && boxes [1][1] == 2) {
        lv = 4;
      }
    }
  }

  if (lv == 4) {
    for (int x = 0; x < 10; x += 1) {
      for (int y = 0; y < 10; y += 1) {
        boxes [x] [y] = 0;
      }
    }
    lv = 5;
  } 

  if (lv == 5) {
    for (int x = 0; x < 8; x += 1) {
      for (int y = 0; y < 8; y += 1) {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) {
          mx = floor(mouseX/125);
          my = floor(mouseY/125);

          boxes [mx] [my] = 3;
        }
        if (boxes [x] [y] != 0 ) {
          fill(190, 10, 10);
          lv = 6;
        }
        else {
          fill(0, random(150, 160), random(255));
          lv = 5;
        }
        rect(x*125, y*125, 125, 125);
      }
      if (boxes [0][0] == 3 && boxes [1][0] == 3 && boxes [2][0] == 3 && boxes [3][0] == 3 
        && boxes [0][1] == 3 && boxes [1][1] == 3 && boxes [2][1] == 3 && boxes [3][1] == 3 
        && boxes [0][2] == 3 && boxes [1][2] == 3 && boxes [2][2] == 3 && boxes [3][2] == 3
        && boxes [0][3] == 3 && boxes [1][3] == 3 && boxes [2][3] == 3 && boxes [3][3] == 3) {
        lv = 6;
      }
    }
  }

  if (lv == 6) {
    for (int x = 0; x < 10; x += 1) {
      for (int y = 0; y < 10; y += 1) {
        boxes [x] [y] = 0;
      }
    }
    lv = 7;
  } 

  if (lv == 7) {
    for (int x = 0; x < 16; x += 1) {
      for (int y = 0; y < 16; y += 1) {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) {
          mx = floor(mouseX/62.5);
          my = floor(mouseY/62.5);

          boxes [mx] [my] = 4;
        }
        if (boxes [x] [y] != 0 ) {
          fill(190, 10, 10);
          lv = 8;
        }
        else {
          fill(0, random(150, 160), random(255));
          lv = 7;
        }
        rect(x*62.5, y*62.5, 62.5, 62.5);
      }
      if (boxes [0][0] == 4 && boxes [1][0] == 4 && boxes [2][0] == 4 && boxes [3][0] == 4 
        && boxes [4][0] == 4 && boxes [5][0] == 4 && boxes [6][0] == 4 && boxes [7][0] == 4

        && boxes [0][1] == 4 && boxes [1][1] == 4 && boxes [2][1] == 4 && boxes [3][1] == 4 
        && boxes [4][1] == 4 && boxes [5][1] == 4 && boxes [6][1] == 4 && boxes [7][1] == 4

        && boxes [0][2] == 4 && boxes [1][2] == 4 && boxes [2][2] == 4 && boxes [3][2] == 4 
        && boxes [4][2] == 4 && boxes [5][2] == 4 && boxes [6][2] == 4 && boxes [7][2] == 4

        && boxes [0][3] == 4 && boxes [1][3] == 4 && boxes [2][3] == 4 && boxes [3][3] == 4 
        && boxes [4][3] == 4 && boxes [5][3] == 4 && boxes [6][3] == 4 && boxes [7][3] == 4

        && boxes [0][4] == 4 && boxes [1][4] == 4 && boxes [2][4] == 4 && boxes [3][4] == 4 
        && boxes [4][4] == 4 && boxes [5][4] == 4 && boxes [6][4] == 4 && boxes [7][4] == 4

        && boxes [0][5] == 4 && boxes [1][5] == 4 && boxes [2][5] == 4 && boxes [3][5] == 4 
        && boxes [4][5] == 4 && boxes [5][5] == 4 && boxes [6][5] == 4 && boxes [7][5] == 4

        && boxes [0][6] == 4 && boxes [1][6] == 4 && boxes [2][6] == 4 && boxes [3][6] == 4 
        && boxes [4][6] == 4 && boxes [5][6] == 4 && boxes [6][6] == 4 && boxes [7][6] == 4

        && boxes [0][7] == 4 && boxes [1][7] == 4 && boxes [2][7] == 4 && boxes [3][7] == 4 
        && boxes [4][7] == 4 && boxes [5][7] == 4 && boxes [6][7] == 4 && boxes [7][7] == 4
        ) {
        lv = 8;
      }
    }
  }

  if (lv == 8) {
    for (int x = 0; x < 10; x += 1) {
      for (int y = 0; y < 10; y += 1) {
        boxes [x] [y] = 0;
      }
    }
    lv = 9;
  } 

  if (lv == 9) {
    for (int x = 0; x < 32; x += 1) {
      for (int y = 0; y < 32; y += 1) {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) {
          mx = floor(mouseX/31.25);
          my = floor(mouseY/31.25);

          boxes [mx] [my] = 5;
        }
        if (boxes [x] [y] != 0 ) {
          fill(190, 10, 10);
          lv = 10;
        }
        else {
          fill(0, random(150, 160), random(255));
          lv = 9;
        }
        rect(x*31.25, y*31.25, 31.25, 31.25);
      }
      if (boxes [0][0] == 5 && boxes [1][0] == 5 && boxes [2][0] == 5 && boxes [3][0] == 5 
        && boxes [4][0] == 5 && boxes [5][0] == 5 && boxes [6][0] == 5 && boxes [7][0] == 5
        && boxes [8][0] == 5 && boxes [9][0] == 5 && boxes [10][0] == 5 && boxes [11][0] == 5
        && boxes [12][0] == 5 && boxes [13][0] == 5 && boxes [14][0] == 5 && boxes [15][0] == 5

        && boxes [0][1] == 5 && boxes [1][1] == 5 && boxes [2][1] == 5 && boxes [3][1] == 5 
        && boxes [4][1] == 5 && boxes [5][1] == 5 && boxes [6][1] == 5 && boxes [7][1] == 5
        && boxes [8][1] == 5 && boxes [9][1] == 5 && boxes [10][1] == 5 && boxes [11][1] == 5
        && boxes [12][1] == 5 && boxes [13][1] == 5 && boxes [14][1] == 5 && boxes [15][1] == 5

        && boxes [0][2] == 5 && boxes [1][2] == 5 && boxes [2][2] == 5 && boxes [3][2] == 5 
        && boxes [4][2] == 5 && boxes [5][2] == 5 && boxes [6][2] == 5 && boxes [7][2] == 5
        && boxes [8][2] == 5 && boxes [9][2] == 5 && boxes [10][2] == 5 && boxes [11][2] == 5
        && boxes [12][2] == 5 && boxes [13][2] == 5 && boxes [14][2] == 5 && boxes [15][2] == 5

        && boxes [0][3] == 5 && boxes [1][3] == 5 && boxes [2][3] == 5 && boxes [3][3] == 5 
        && boxes [4][3] == 5 && boxes [5][3] == 5 && boxes [6][3] == 5 && boxes [7][3] == 5
        && boxes [8][3] == 5 && boxes [9][3] == 5 && boxes [10][3] == 5 && boxes [11][3] == 5
        && boxes [12][3] == 5 && boxes [13][3] == 5 && boxes [14][3] == 5 && boxes [15][3] == 5

        && boxes [0][4] == 5 && boxes [1][4] == 5 && boxes [2][4] == 5 && boxes [3][4] == 5 
        && boxes [4][4] == 5 && boxes [5][4] == 5 && boxes [6][4] == 5 && boxes [7][4] == 5
        && boxes [8][4] == 5 && boxes [9][4] == 5 && boxes [10][4] == 5 && boxes [11][4] == 5
        && boxes [12][4] == 5 && boxes [13][4] == 5 && boxes [14][4] == 5 && boxes [15][4] == 5

        && boxes [0][5] == 5 && boxes [1][5] == 5 && boxes [2][5] == 5 && boxes [3][5] == 5 
        && boxes [4][5] == 5 && boxes [5][5] == 5 && boxes [6][5] == 5 && boxes [7][5] == 5
        && boxes [8][5] == 5 && boxes [9][5] == 5 && boxes [10][5] == 5 && boxes [11][5] == 5
        && boxes [12][5] == 5 && boxes [13][5] == 5 && boxes [14][5] == 5 && boxes [15][5] == 5

        && boxes [0][6] == 5 && boxes [1][6] == 5 && boxes [2][6] == 5 && boxes [3][6] == 5 
        && boxes [4][6] == 5 && boxes [5][6] == 5 && boxes [6][6] == 5 && boxes [7][6] == 5
        && boxes [8][6] == 5 && boxes [9][6] == 5 && boxes [10][6] == 5 && boxes [11][6] == 5
        && boxes [12][6] == 5 && boxes [13][6] == 5 && boxes [14][6] == 5 && boxes [15][6] == 5

        && boxes [0][7] == 5 && boxes [1][7] == 5 && boxes [2][7] == 5 && boxes [3][7] == 5 
        && boxes [4][7] == 5 && boxes [5][7] == 5 && boxes [6][7] == 5 && boxes [7][7] == 5
        && boxes [8][7] == 5 && boxes [9][7] == 5 && boxes [10][7] == 5 && boxes [11][7] == 5
        && boxes [12][7] == 5 && boxes [13][7] == 5 && boxes [14][7] == 5 && boxes [15][7] == 5
        
        && boxes [0][8] == 5 && boxes [1][8] == 5 && boxes [2][8] == 5 && boxes [3][8] == 5 
        && boxes [4][8] == 5 && boxes [5][8] == 5 && boxes [6][8] == 5 && boxes [7][8] == 5
        && boxes [8][8] == 5 && boxes [9][8] == 5 && boxes [10][8] == 5 && boxes [11][8] == 5
        && boxes [12][8] == 5 && boxes [13][8] == 5 && boxes [14][8] == 5 && boxes [15][8] == 5

        && boxes [0][9] == 5 && boxes [1][9] == 5 && boxes [2][9] == 5 && boxes [3][9] == 5 
        && boxes [4][9] == 5 && boxes [5][9] == 5 && boxes [6][9] == 5 && boxes [7][9] == 5
        && boxes [8][9] == 5 && boxes [9][9] == 5 && boxes [10][9] == 5 && boxes [11][9] == 5
        && boxes [12][9] == 5 && boxes [13][9] == 5 && boxes [14][9] == 5 && boxes [15][9] == 5
                
        && boxes [0][10] == 5 && boxes [1][10] == 5 && boxes [2][10] == 5 && boxes [3][10] == 5 
        && boxes [4][10] == 5 && boxes [5][10] == 5 && boxes [6][10] == 5 && boxes [7][10] == 5
        && boxes [8][10] == 5 && boxes [9][10] == 5 && boxes [10][10] == 5 && boxes [11][10] == 5
        && boxes [12][10] == 5 && boxes [13][10] == 5 && boxes [14][10] == 5 && boxes [15][10] == 5
        
        && boxes [0][11] == 5 && boxes [1][11] == 5 && boxes [2][11] == 5 && boxes [3][11] == 5 
        && boxes [4][11] == 5 && boxes [5][11] == 5 && boxes [6][11] == 5 && boxes [7][11] == 5
        && boxes [8][11] == 5 && boxes [9][11] == 5 && boxes [10][11] == 5 && boxes [11][11] == 5
        && boxes [12][11] == 5 && boxes [13][11] == 5 && boxes [14][11] == 5 && boxes [15][11] == 5
        
        && boxes [0][12] == 5 && boxes [1][12] == 5 && boxes [2][12] == 5 && boxes [3][12] == 5 
        && boxes [4][12] == 5 && boxes [5][12] == 5 && boxes [6][12] == 5 && boxes [7][12] == 5
        && boxes [8][12] == 5 && boxes [9][12] == 5 && boxes [10][12] == 5 && boxes [11][12] == 5
        && boxes [12][12] == 5 && boxes [13][12] == 5 && boxes [14][12] == 5 && boxes [15][12] == 5
       
        && boxes [0][13] == 5 && boxes [1][13] == 5 && boxes [2][13] == 5 && boxes [3][13] == 5 
        && boxes [4][13] == 5 && boxes [5][13] == 5 && boxes [6][13] == 5 && boxes [7][13] == 5
        && boxes [8][13] == 5 && boxes [9][13] == 5 && boxes [10][13] == 5 && boxes [11][13] == 5
        && boxes [12][13] == 5 && boxes [13][13] == 5 && boxes [14][13] == 5 && boxes [15][13] == 5
        
        && boxes [0][14] == 5 && boxes [1][14] == 5 && boxes [2][14] == 5 && boxes [3][14] == 5 
        && boxes [4][14] == 5 && boxes [5][14] == 5 && boxes [6][14] == 5 && boxes [7][14] == 5
        && boxes [8][14] == 5 && boxes [9][14] == 5 && boxes [10][14] == 5 && boxes [11][14] == 5
        && boxes [12][14] == 5 && boxes [13][14] == 5 && boxes [14][14] == 5 && boxes [15][14] == 5
        
        && boxes [0][15] == 5 && boxes [1][15] == 5 && boxes [2][15] == 5 && boxes [3][15] == 5 
        && boxes [4][15] == 5 && boxes [5][15] == 5 && boxes [6][15] == 5 && boxes [7][15] == 5
        && boxes [8][15] == 5 && boxes [9][15] == 5 && boxes [10][15] == 5 && boxes [11][15] == 5
        && boxes [12][15] == 5 && boxes [13][15] == 5 && boxes [14][15] == 5 && boxes [15][15] == 5
        ) {
        lv = 10;
      }
    }
  }

  if (lv == 10) {
    for (int x = 0; x < 10; x += 1) {
      for (int y = 0; y < 10; y += 1) {
        boxes [x] [y] = 0;
      }
    }
    lv = 11;
  } 

  if (lv == 11) {
    for (int x = 0; x < 64; x += 1) {
      for (int y = 0; y < 64; y += 1) {
        if (mousePressed == true && mouseX > 0 && mouseX < 500 && mouseY > 0 && mouseY < 500) {
          mx = floor(mouseX/15.625);
          my = floor(mouseY/15.625);

          boxes [mx] [my] = 6;
        }
        if (boxes [x] [y] != 0 ) {
          fill(190, 10, 10);
          lv = 12;
        }
        else {
          fill(0, random(150, 160), random(255));
          lv = 11;
        }
        rect(x*15.625, y*15.625, 15.625, 15.625);
      }

/*
      if (boxes [0][0] == 6 && boxes [1][0] == 6 && boxes [2][0] == 6 && boxes [3][0] == 6 
        && boxes [4][0] == 6 && boxes [5][0] == 6 && boxes [6][0] == 6 && boxes [7][0] == 6
        && boxes [8][0] == 6 && boxes [9][0] == 6 && boxes [10][0] == 6 && boxes [11][0] == 6
        && boxes [12][0] == 6 && boxes [13][0] == 6 && boxes [14][0] == 6 && boxes [15][0] == 6
        && boxes [16][0] == 6 && boxes [17][0] == 6 && boxes [18][0] == 6 && boxes [19][0] == 6
        && boxes [20][0] == 6 && boxes [21][0] == 6 && boxes [22][0] == 6 && boxes [23][0] == 6
        && boxes [24][0] == 6 && boxes [25][0] == 6 && boxes [26][0] == 6 && boxes [27][0] == 6
        && boxes [28][0] == 6 && boxes [29][0] == 6 && boxes [30][0] == 6 && boxes [31][0] == 6) {
        if (boxes [0][1] == 6 && boxes [1][1] == 6 && boxes [2][1] == 6 && boxes [3][1] == 6 
          && boxes [4][1] == 6 && boxes [5][1] == 6 && boxes [6][1] == 6 && boxes [7][1] == 6
          && boxes [8][1] == 6 && boxes [9][1] == 6 && boxes [10][1] == 6 && boxes [11][1] == 6
          && boxes [12][1] == 6 && boxes [13][1] == 6 && boxes [14][1] == 6 && boxes [15][1] == 6
          && boxes [16][1] == 6 && boxes [17][1] == 6 && boxes [18][1] == 6 && boxes [19][1] == 6
          && boxes [20][1] == 6 && boxes [21][1] == 6 && boxes [22][1] == 6 && boxes [23][1] == 6
          && boxes [24][1] == 6 && boxes [25][1] == 6 && boxes [26][1] == 6 && boxes [27][1] == 6
          && boxes [28][1] == 6 && boxes [29][1] == 6 && boxes [30][1] == 6 && boxes [31][1] == 6) {
          if (boxes [0][2] == 6 && boxes [1][2] == 6 && boxes [2][2] == 6 && boxes [3][2] == 6 
            && boxes [4][2] == 6 && boxes [5][2] == 6 && boxes [6][2] == 6 && boxes [7][2] == 6
            && boxes [8][2] == 6 && boxes [9][2] == 6 && boxes [10][2] == 6 && boxes [11][2] == 6
            && boxes [12][2] == 6 && boxes [13][2] == 6 && boxes [14][2] == 6 && boxes [15][2] == 6
            && boxes [16][2] == 6 && boxes [17][2] == 6 && boxes [18][2] == 6 && boxes [19][2] == 6
            && boxes [20][2] == 6 && boxes [21][2] == 6 && boxes [22][2] == 6 && boxes [23][2] == 6
            && boxes [24][2] == 6 && boxes [25][2] == 6 && boxes [26][2] == 6 && boxes [27][2] == 6
            && boxes [28][2] == 6 && boxes [29][2] == 6 && boxes [30][2] == 6 && boxes [31][2] == 6) {
            if (boxes [0][3] == 6 && boxes [1][3] == 6 && boxes [2][3] == 6 && boxes [3][3] == 6 
              && boxes [4][3] == 6 && boxes [5][3] == 6 && boxes [6][3] == 6 && boxes [7][3] == 6
              && boxes [8][3] == 6 && boxes [9][3] == 6 && boxes [10][3] == 6 && boxes [11][3] == 6
              && boxes [12][3] == 6 && boxes [13][3] == 6 && boxes [14][3] == 6 && boxes [15][3] == 6
              && boxes [16][3] == 6 && boxes [17][3] == 6 && boxes [18][3] == 6 && boxes [19][3] == 6
              && boxes [20][3] == 6 && boxes [21][3] == 6 && boxes [22][3] == 6 && boxes [23][3] == 6
              && boxes [24][3] == 6 && boxes [25][3] == 6 && boxes [26][3] == 6 && boxes [27][3] == 6
              && boxes [28][3] == 6 && boxes [29][3] == 6 && boxes [30][3] == 6 && boxes [31][3] == 6) {
              if (boxes [0][4] == 6 && boxes [1][4] == 6 && boxes [2][4] == 6 && boxes [3][4] == 6 
                && boxes [4][4] == 6 && boxes [5][4] == 6 && boxes [6][4] == 6 && boxes [7][4] == 6
                && boxes [8][4] == 6 && boxes [9][4] == 6 && boxes [10][4] == 6 && boxes [11][4] == 6
                && boxes [12][4] == 6 && boxes [13][4] == 6 && boxes [14][4] == 6 && boxes [15][4] == 6
                && boxes [16][4] == 6 && boxes [17][4] == 6 && boxes [18][4] == 6 && boxes [19][4] == 6
                && boxes [20][4] == 6 && boxes [21][4] == 6 && boxes [22][4] == 6 && boxes [23][4] == 6
                && boxes [24][4] == 6 && boxes [25][4] == 6 && boxes [26][4] == 6 && boxes [27][4] == 6
                && boxes [28][4] == 6 && boxes [29][4] == 6 && boxes [30][4] == 6 && boxes [31][4] == 6) {
                if (boxes [0][5] == 6 && boxes [1][5] == 6 && boxes [2][5] == 6 && boxes [3][5] == 6 
                  && boxes [4][5] == 6 && boxes [5][5] == 6 && boxes [6][5] == 6 && boxes [7][5] == 6
                  && boxes [8][5] == 6 && boxes [9][5] == 6 && boxes [10][5] == 6 && boxes [11][5] == 6
                  && boxes [12][5] == 6 && boxes [13][5] == 6 && boxes [14][5] == 6 && boxes [15][5] == 6
                  && boxes [16][5] == 6 && boxes [17][5] == 6 && boxes [18][5] == 6 && boxes [19][5] == 6
                  && boxes [20][5] == 6 && boxes [21][5] == 6 && boxes [22][5] == 6 && boxes [23][5] == 6
                  && boxes [24][5] == 6 && boxes [25][5] == 6 && boxes [26][5] == 6 && boxes [27][5] == 6
                  && boxes [28][5] == 6 && boxes [29][5] == 6 && boxes [30][5] == 6 && boxes [31][5] == 6) {
                  if (boxes [0][6] == 6 && boxes [1][6] == 6 && boxes [2][6] == 6 && boxes [3][6] == 6 
                    && boxes [4][6] == 6 && boxes [5][6] == 6 && boxes [6][6] == 6 && boxes [7][6] == 6
                    && boxes [8][6] == 6 && boxes [9][6] == 6 && boxes [10][6] == 6 && boxes [11][6] == 6
                    && boxes [12][6] == 6 && boxes [13][6] == 6 && boxes [14][6] == 6 && boxes [15][6] == 6
                    && boxes [16][6] == 6 && boxes [17][6] == 6 && boxes [18][6] == 6 && boxes [19][6] == 6
                    && boxes [20][6] == 6 && boxes [21][6] == 6 && boxes [22][6] == 6 && boxes [23][6] == 6
                    && boxes [24][6] == 6 && boxes [25][6] == 6 && boxes [26][6] == 6 && boxes [27][6] == 6
                    && boxes [28][6] == 6 && boxes [29][6] == 6 && boxes [30][6] == 6 && boxes [31][6] == 6) {
                    if (boxes [0][7] == 6 && boxes [1][7] == 6 && boxes [2][7] == 6 && boxes [3][7] == 6 
                      && boxes [4][7] == 6 && boxes [5][7] == 6 && boxes [6][7] == 6 && boxes [7][7] == 6
                      && boxes [8][7] == 6 && boxes [9][7] == 6 && boxes [10][7] == 6 && boxes [11][7] == 6
                      && boxes [12][7] == 6 && boxes [13][7] == 6 && boxes [14][7] == 6 && boxes [15][7] == 6
                      && boxes [16][7] == 6 && boxes [17][7] == 6 && boxes [18][7] == 6 && boxes [19][7] == 6
                      && boxes [20][7] == 6 && boxes [21][7] == 6 && boxes [22][7] == 6 && boxes [23][7] == 6
                      && boxes [24][7] == 6 && boxes [25][7] == 6 && boxes [26][7] == 6 && boxes [27][7] == 6
                      && boxes [28][7] == 6 && boxes [29][7] == 6 && boxes [30][7] == 6 && boxes [31][7] == 6) {
                      if (boxes [0][8] == 6 && boxes [1][8] == 6 && boxes [2][8] == 6 && boxes [3][8] == 6 
                        && boxes [4][8] == 6 && boxes [5][8] == 6 && boxes [6][8] == 6 && boxes [7][8] == 6
                        && boxes [8][8] == 6 && boxes [9][8] == 6 && boxes [10][8] == 6 && boxes [11][8] == 6
                        && boxes [12][8] == 6 && boxes [13][8] == 6 && boxes [14][8] == 6 && boxes [15][8] == 6
                        && boxes [16][8] == 6 && boxes [17][8] == 6 && boxes [18][8] == 6 && boxes [19][8] == 6
                        && boxes [20][8] == 6 && boxes [21][8] == 6 && boxes [22][8] == 6 && boxes [23][8] == 6
                        && boxes [24][8] == 6 && boxes [25][8] == 6 && boxes [26][8] == 6 && boxes [27][8] == 6
                        && boxes [28][8] == 6 && boxes [29][8] == 6 && boxes [30][8] == 6 && boxes [31][8] == 6) {
                        if (boxes [0][9] == 6 && boxes [1][9] == 6 && boxes [2][9] == 6 && boxes [3][9] == 6 
                          && boxes [4][9] == 6 && boxes [5][9] == 6 && boxes [6][9] == 6 && boxes [7][9] == 6
                          && boxes [8][9] == 6 && boxes [9][9] == 6 && boxes [10][9] == 6 && boxes [11][9] == 6
                          && boxes [12][9] == 6 && boxes [13][9] == 6 && boxes [14][9] == 6 && boxes [15][9] == 6
                          && boxes [16][9] == 6 && boxes [17][9] == 6 && boxes [18][9] == 6 && boxes [19][9] == 6
                          && boxes [20][9] == 6 && boxes [21][9] == 6 && boxes [22][9] == 6 && boxes [23][9] == 6
                          && boxes [24][9] == 6 && boxes [25][9] == 6 && boxes [26][9] == 6 && boxes [27][9] == 6
                          && boxes [28][9] == 6 && boxes [29][9] == 6 && boxes [30][9] == 6 && boxes [31][9] == 6) {

                          if (boxes [0][10] == 6 && boxes [1][10] == 6 && boxes [2][10] == 6 && boxes [3][10] == 6 
                            && boxes [4][10] == 6 && boxes [5][10] == 6 && boxes [6][10] == 6 && boxes [7][10] == 6
                            && boxes [8][10] == 6 && boxes [9][10] == 6 && boxes [10][10] == 6 && boxes [11][10] == 6
                            && boxes [12][10] == 6 && boxes [13][10] == 6 && boxes [14][10] == 6 && boxes [15][10] == 6
                            && boxes [16][10] == 6 && boxes [17][10] == 6 && boxes [18][10] == 6 && boxes [19][10] == 6
                            && boxes [20][10] == 6 && boxes [21][10] == 6 && boxes [22][10] == 6 && boxes [23][10] == 6
                            && boxes [24][10] == 6 && boxes [25][10] == 6 && boxes [26][10] == 6 && boxes [27][10] == 6
                            && boxes [28][10] == 6 && boxes [29][10] == 6 && boxes [30][10] == 6 && boxes [31][10] == 6) {

                            if (boxes [0][11] == 6 && boxes [1][11] == 6 && boxes [2][11] == 6 && boxes [3][11] == 6 
                              && boxes [4][11] == 6 && boxes [5][11] == 6 && boxes [6][11] == 6 && boxes [7][11] == 6
                              && boxes [8][11] == 6 && boxes [9][11] == 6 && boxes [10][11] == 6 && boxes [11][11] == 6
                              && boxes [12][11] == 6 && boxes [13][11] == 6 && boxes [14][11] == 6 && boxes [15][11] == 6
                              && boxes [16][11] == 6 && boxes [17][11] == 6 && boxes [18][11] == 6 && boxes [19][11] == 6
                              && boxes [20][11] == 6 && boxes [21][11] == 6 && boxes [22][11] == 6 && boxes [23][11] == 6
                              && boxes [24][11] == 6 && boxes [25][11] == 6 && boxes [26][11] == 6 && boxes [27][11] == 6
                              && boxes [28][11] == 6 && boxes [29][11] == 6 && boxes [30][11] == 6 && boxes [31][11] == 6) {

                              if (boxes [0][12] == 6 && boxes [1][12] == 6 && boxes [2][12] == 6 && boxes [3][12] == 6 
                                && boxes [4][12] == 6 && boxes [5][12] == 6 && boxes [6][12] == 6 && boxes [7][12] == 6
                                && boxes [8][12] == 6 && boxes [9][12] == 6 && boxes [10][12] == 6 && boxes [11][12] == 6
                                && boxes [12][12] == 6 && boxes [13][12] == 6 && boxes [14][12] == 6 && boxes [15][12] == 6
                                && boxes [16][12] == 6 && boxes [17][12] == 6 && boxes [18][12] == 6 && boxes [19][12] == 6
                                && boxes [20][12] == 6 && boxes [21][12] == 6 && boxes [22][12] == 6 && boxes [23][12] == 6
                                && boxes [24][12] == 6 && boxes [25][12] == 6 && boxes [26][12] == 6 && boxes [27][12] == 6
                                && boxes [28][12] == 6 && boxes [29][12] == 6 && boxes [30][12] == 6 && boxes [31][12] == 6) {

                                if (boxes [0][13] == 6 && boxes [1][13] == 6 && boxes [2][13] == 6 && boxes [3][13] == 6 
                                  && boxes [4][13] == 6 && boxes [5][13] == 6 && boxes [6][13] == 6 && boxes [7][13] == 6
                                  && boxes [8][13] == 6 && boxes [9][13] == 6 && boxes [10][13] == 6 && boxes [11][13] == 6
                                  && boxes [12][13] == 6 && boxes [13][13] == 6 && boxes [14][13] == 6 && boxes [15][13] == 6
                                  && boxes [16][13] == 6 && boxes [17][13] == 6 && boxes [18][13] == 6 && boxes [19][13] == 6
                                  && boxes [20][13] == 6 && boxes [21][13] == 6 && boxes [22][13] == 6 && boxes [23][13] == 6
                                  && boxes [24][13] == 6 && boxes [25][13] == 6 && boxes [26][13] == 6 && boxes [27][13] == 6
                                  && boxes [28][13] == 6 && boxes [29][13] == 6 && boxes [30][13] == 6 && boxes [31][13] == 6) {

                                  if (boxes [0][14] == 6 && boxes [1][14] == 6 && boxes [2][14] == 6 && boxes [3][14] == 6 
                                    && boxes [4][14] == 6 && boxes [5][14] == 6 && boxes [6][14] == 6 && boxes [7][14] == 6
                                    && boxes [8][14] == 6 && boxes [9][14] == 6 && boxes [10][14] == 6 && boxes [11][14] == 6
                                    && boxes [12][14] == 6 && boxes [13][14] == 6 && boxes [14][14] == 6 && boxes [15][14] == 6
                                    && boxes [16][14] == 6 && boxes [17][14] == 6 && boxes [18][14] == 6 && boxes [19][14] == 6
                                    && boxes [20][14] == 6 && boxes [21][14] == 6 && boxes [22][14] == 6 && boxes [23][14] == 6
                                    && boxes [24][14] == 6 && boxes [25][14] == 6 && boxes [26][14] == 6 && boxes [27][14] == 6
                                    && boxes [28][14] == 6 && boxes [29][14] == 6 && boxes [30][14] == 6 && boxes [31][14] == 6) {

                                    if (boxes [0][15] == 6 && boxes [1][15] == 6 && boxes [2][15] == 6 && boxes [3][15] == 6 
                                      && boxes [4][15] == 6 && boxes [5][15] == 6 && boxes [6][15] == 6 && boxes [7][15] == 6
                                      && boxes [8][15] == 6 && boxes [9][15] == 6 && boxes [10][15] == 6 && boxes [11][15] == 6
                                      && boxes [12][15] == 6 && boxes [13][15] == 6 && boxes [14][15] == 6 && boxes [15][15] == 6
                                      && boxes [16][15] == 6 && boxes [17][15] == 6 && boxes [18][15] == 6 && boxes [19][15] == 6
                                      && boxes [20][15] == 6 && boxes [21][15] == 6 && boxes [22][15] == 6 && boxes [23][15] == 6
                                      && boxes [24][15] == 6 && boxes [25][15] == 6 && boxes [26][15] == 6 && boxes [27][15] == 6
                                      && boxes [28][15] == 6 && boxes [29][15] == 6 && boxes [30][15] == 6 && boxes [31][15] == 6) {
                                      ) {
                                        lv = 12;
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }    
      } */
    }
  }
}


