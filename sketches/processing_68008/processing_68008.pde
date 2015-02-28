
class Drop {
  float x;
  float y;
  float s;
  float c1;
  float c2;
  float speed;

  Drop(float tmpX, float tmpS, float tmpC1, float tmpC2) {
    x = tmpX;
    y = 0;
    s = tmpS;
    c1 = tmpC1;
    c2 = tmpC2;
    speed = 6 -s;
  }

  void move() {
    y += speed;

    if (y > height) {
      y =  - 70 * (s / 3);
      c1 = random(150);
      c2 = random(255);
      x = random(width);
    }
  }

  void display() {
    fill(c1, c2, 255);
    for (int i = 10; i > 0;i--) {
      ellipse(x, y+i*1.2*s, s*i+3, s*i+3);
    }
  }
}


