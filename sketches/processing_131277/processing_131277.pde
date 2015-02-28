
float[][] LIGHT = new float[30][20];
int count;

void setup() {
  size(600, 400);
  colorMode(RGB, 255);
  background(255);
}

void draw() {
  background(255);

  for (int i = 0 ; i < 30 ; i++) {
    for (int j = 0 ; j < 20 ; j++) {
      if (LIGHT[i][j] % 4 == 1) {
        fill(255, 0, 0);
      } else if (LIGHT[i][j] % 4 == 2) {
        fill(0, 255, 0);
      } else if (LIGHT[i][j] % 4 == 3) {
        fill(0, 0, 255);
      } else if (LIGHT[i][j] % 4 == 0) {
        fill(255);
      }

      ellipse((i * 20) + 10, (j * 20) + 10, 20, 20);
    }
  }

  for (int j = 0 ; j < 20 ; j++) {
    for (int i = 1 ; i < 30 ; i++) {
      if (count % 2 == 1) {
        LIGHT[i - 1][j] = LIGHT[i][j];
      }
    }
    
    LIGHT[29][j] = LIGHT[1][j];
  }
}


void mousePressed() {
  for (int i = 0 ; i < 30 ; i++) {
    for (int j = 0 ; j < 20 ; j++) {
      if ( dist((i * 20) + 10, (j * 20) + 10, mouseX, mouseY) <= 10) {
        LIGHT[i][j] += 1;
      }
    }
  }
}

void keyPressed() {
  switch(key) {
    case ' ' :
    count++;
  }
}


