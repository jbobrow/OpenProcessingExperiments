
Curve[] curves = new Curve[2];

int num;

void setup() {
  size(420, 420);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  for (int i = 0 ; i < curves.length;i++) {
    if (i % 2 == 0) {
      num = 1;
    }
    else {
      num = 2;
    }

    curves[i] = new Curve(num);
  }
}

void draw() {
  background(0);

  for (int i = 0 ; i < curves.length;i++) {
    curves[i].display();
  }
}

class Curve {
  float r;
  float a = 200;
  float n = 0;
  float d = 2;

  float x;
  float y;

  float hue;
  float complementary = hue + 180;

  int num;

  Curve(int tmpNum) {
    num = tmpNum;

    if (num == 1) {
      d += 1;
    }
  }

  void display() {
    if (num == 1) {
      fill(complementary, 80, 100, 80);
    }
    else {
      fill(hue, 80, 100, 80);
    }

    noStroke();


    beginShape();
    for (int t = 0; t < 360;t++) {
      r = a * sin(radians(t * n / d));

      x = r * cos(radians(t)) + width/2;
      y = r * sin(radians(t)) + height/2;

      if (t % 10 == 0) {
        curveVertex(x, y);
      }
    }
    endShape(CLOSE);

    n += num * 0.003*5;
    d += num * 0.0001*5;

    hue += 0.5;
    complementary += 0.5;

    if (hue > 360) {
      hue = 0;
    }
    if (complementary > 360) {
      complementary = 0;
    }
  }
}



