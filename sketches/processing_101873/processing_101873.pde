
Circle[] circles = new Circle[20];

void setup() {
  size(200, 200);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  noStroke();
  fill(360, 100);
  rect(0, 0, width, height);

  for (int i = 0 ; i < circles.length;i++) {
    circles[i].move();
    circles[i].display();
  }
}

class Circle {
  float next_x = random(width);
  float next_y = random(height);
  float x = random(width);
  float y = random(height);
  float hue = random(360);

  float easing_x = random(0.01, 0.04);
  float easing_y = random(0.01, 0.04);

  int r = 20;

  Circle() {
  }

  void move() {
    x += (next_x - x) * easing_x;
    y += (next_y - y) * easing_y;

    if ((int)next_x == (int)x || (int)next_y == (int)y) {
      next_x = random(width);
      next_y = random(height);
    }
  }

  void display() {
    stroke(360, 80);
    fill(hue, 100, 100, 100);
    ellipse(x, y, r, r);
  }
}

