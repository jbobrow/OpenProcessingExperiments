
Dots[] dots = new Dots[8];

void setup() {
  size(320, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0; i < dots.length;i++) {
    dots[i] = new Dots(i,dots.length);
  }

  noStroke();
}

void draw() {
  background(360);

  for (int i = 0; i < dots.length;i++) {
    dots[i].move();
    dots[i].display();
  }
}

class Dots {
  int  r = 20;
  float x;
  float y;
  float hue;

  int num;
  int val;

  Dots(int tmpNum, int tmpVal) {
    num = tmpNum;
    val = tmpVal;

    y = num * r * 2;

    hue = 360 * num / val;
  }

  void move() {
    y += 0.5;

    if (y > height + r/2) {
      y = -r/2;
    }
  }

  void display() {

    for (int i = 0 ; i < 9; i++) {
      if (num % 2 == 0) {
        x = i * r * 2 + r;
      } else {
        x = i * r * 2;
      }

      fill(hue, 60, 100);
      ellipse(x, y, r, r);
    }
  }
}



