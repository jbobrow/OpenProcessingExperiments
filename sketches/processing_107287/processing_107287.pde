
Wave[] waves = new Wave[30];

void setup() {
  size(420, 400);
  background(0);
  smooth();

  for (int i = 0 ; i < waves.length;i++) {
    waves[i] = new Wave();
  }

  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(0);

  for (int i = 0 ; i < waves.length;i++) {
    waves[i].move();
    waves[i].display();
  }
}

class MyRect {
  int num;
  float x;
  float y;
  float w = 20;
  float h;
  float theta;
  float theta_delta;
  float max_h;

  color c = color(random(255), random(255), random(255));

  MyRect(int tmpNum, float tmpY, float tmpTheta, float tmpDelta, float tmpMax_h) {
    num = tmpNum;

    x = num * w + w/2;
    y = tmpY;

    theta = tmpTheta;
    theta_delta = tmpDelta;

    max_h = tmpMax_h;
  }

  void move() {
    h = max_h * sin(radians((180 * num / 20) + theta));
    theta += theta_delta;

    if (h < 0) {
      c = color(random(255), random(255), random(255));
      h = 0;
    }
  }

  void display() {
    fill(c, 80);
    rect(x, y, w, h);
  }
}

class Wave {
  MyRect[] rects = new MyRect[21];

  float y = random(height);
  float theta = random(360);
  float theta_delta = random(0.1, 1.5);
  float max_h = random(10, height*0.7);

  Wave() {
    for (int i = 0 ; i < rects.length;i++) {
      rects[i] = new MyRect(i, y, theta, theta_delta, max_h);
    }
  }

  void move() {
  }

  void display() {
    for (int i = 0 ; i < rects.length;i++) {
      rects[i].move();
      rects[i].display();
    }
  }
}



