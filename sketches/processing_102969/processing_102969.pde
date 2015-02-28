
int N = 10;
int n = 4;
Calc[][] calc = new Calc[N][n];

int flg = 1;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < N;i++) {
    for (int j = 0; j < n;j++) {
      calc[i][j] = new Calc();
    }
  }
}

void draw() {
  background(360);

  if (flg == 1) {
    n = 4;
  }
  else {
    n = 3;
  }


  for (int i = 0 ; i < N;i++) {
    stroke(i*360/N, 100, 100, 80);
    fill(i*360/N, 80, 100, 80);
    strokeWeight(3);
    beginShape();
    for (int j = 0; j < n;j++) {
      vertex(calc[i][j].x, calc[i][j].y);
      ellipse(calc[i][j].x, calc[i][j].y, 15, 15);
      calc[i][j].coordinateUpdate();
    }
    endShape(CLOSE);
  }
}


void mousePressed() {
  flg *= -1;
}

class Calc {
  Easing easing = new Easing();

  float x = random(width);
  float y = random(height);

  Calc() {
  }

  void coordinateUpdate() {
    PVector acceleration = easing.ease(x, y);
    x +=acceleration.x;
    y +=acceleration.y;
  }
}

class Easing {
  float next_x = random(width);
  float next_y = random(height);
  float easing_x = random(0.01, 0.04);
  float easing_y = random(0.01, 0.04);

  PVector ease(float x, float y) {
    PVector acceleration = new PVector( (next_x - x) * easing_x, (next_y - y) * easing_y);
    if ((int)next_x == (int)x || (int)next_y == (int)y) {
      next_x = random(width);
      next_y = random(height);
    }
    return acceleration;
  }
}

