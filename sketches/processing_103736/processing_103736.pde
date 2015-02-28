
class Box {
  float x;
  float y;
  float hue  = random(360);
  float spd = random(1, 3);
  float sign;
  int val = (int)random(100, 200);

  Line[] lines = new Line[val];

  Box() {
    x = random(width-30);
    y = random(height-val);

    if (random(1) >= 0.5) {
      sign = 1;
    }
    else {
      sign = -1;
    }

    for (int i = 0 ; i < lines.length;i++) {
      lines[i] = new Line(hue);
    }
  }

  void move() {
    y += sign * spd;

    if (y > height - val || y < 0) {
      sign *= -1;
    }
  }

  void display() {
    for (int i = 0 ; i < val;i++) {
      lines[i].display(x, y+i, x+30);
    }
  }
}


