
int x, y;
int rB = 40; // daimaru
int rS = 25; //shoumaru
float [][] clr = new float[4][4];
float [][] spd = {{ 2.0, 4.2, 1.4, 2.0 } , 
                  { 4.3, 1.8, 0.7, 1.6 } , 
                  { 0.5, 1.4, 4.5, 0.8 } ,
                  { 0.1, 1.3, 0.8, 2.1 }};

void setup() {
  size(300, 450);
  background(255);
  smooth();

  for (y = 0; y < 4; y++) {
    for (x = 0; x < 4; x++) {
      clr[y][x] = 0;
    }
  }

  daimaru();
}

void draw() {
  noStroke();
  clrChangeA();
  for (int y = 75; y <= 500; y += 150) {
    for (int x = 0; x <= 500; x += 150) {
      ellipse(x, y, rS, rS);
    }
  }
  
  clrChangeB();
  for ( int y = 0; y <= 450; y += 150) {
    for (int x = 75; x <= 450; x += 150) {
      ellipse(x, y, rS, rS);
    }
  }
}

// daimaru shikitsume
void daimaru() {
  strokeWeight(3);
  stroke(20, 100, 200);
  noFill();
  for (y = 0; y <= 500; y += 150) {
    for (x = 0; x <= 500; x += 150) {
      ellipse(x, y, rB, rB);
    }
  }

  for (y = 75; y <= 500; y += 150) {
    for (x = 75; x <= 500; x += 150) {
      ellipse(x, y, rB, rB);
    }
  }
}

// shoumaru color change
void clrChangeA() {
  for (y = 0; y < 4; y ++) {
    for (x = 0; x < 4; x ++) {
      clr[y][x] += spd[y][x];
      if (clr[y][x] > 255 || clr[y][x] < 0) {
        spd[y][x] = -spd[y][x];
      }
      fill(20, 200, clr[y][x]);
    }
  }
}

void clrChangeB() {
  for (y = 0; y < 4; y ++) {
    for (x = 0; x < 4; x ++) {
      clr[y][x] += spd[y][x];
      if (clr[y][x] > 255 || clr[y][x] < 0) {
        spd[y][x] = -spd[y][x];
      }
      fill(50, clr[y][x], 200);
    }
  }
}



