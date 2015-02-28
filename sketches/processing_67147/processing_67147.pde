
int bulbArray[];
int xBulb;
int yBulb;
int bulbSize;
int state;

void setup() {
  smooth();
  noStroke();
  size(500, 500);
  bulbArray = new int[6];
  xBulb = 0;
  yBulb = 250;
  bulbSize = 40;
  state = 0;
}

void draw() {
  background(60, 100, 255);
  for (int i = 0; i < bulbArray.length; i++) {
    fill(0);
    xBulb = i * 60 + 100;
    ellipse(xBulb, yBulb, bulbSize, bulbSize);
  }
  if (keyCode == 'Q') {
    state = 1;
  }
  if (state == 1) {
    for (int i = 0; i < bulbArray.length; i++) {
      fill(250, 250, 0);
      xBulb = i * 60 + 100;
      ellipse(xBulb, yBulb, bulbSize, bulbSize);
    }
  }
  if (keyCode == 'W') {
    state = 2;
  }
  if (state == 2) {
    for (int i = 0; i < 3; i++) {
      xBulb = i * 120 + 100;
      fill(250, 250, 0);
      ellipse(xBulb, yBulb, bulbSize, bulbSize);
    }
  }
  if (keyCode == 'E') {
    state = 3;
  }
  if (state == 3) {
    for (int i = 0; i < bulbArray.length; i++) {
      xBulb = i * 60 + 100;
      fill(0);
      ellipse(xBulb, yBulb, bulbSize, bulbSize);
    }
  }
}


