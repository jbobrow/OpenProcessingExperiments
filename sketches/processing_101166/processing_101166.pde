
Circle[] circles = new Circle[200];

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(360);

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }
}

void draw() {
  background(360);

  for (int i = 0 ; i < circles.length;i++) {
    circles[i].move();
    circles[i].display();
  }
}

class Circle {
  float default_x = random(width);
  float default_y = random(height);
  float x;
  float y;
  float hue = random(360);

  float easing_x = random(0.03, 0.07)*1.5;
  float easing_y = random(0.03, 0.07)*1.5;

  int r = 10;

  Circle() {
    x = default_x;
    y = default_y;
  }

  void move() {
    if (mousePressed == true) {
      x += (mouseX - x) * easing_x;
      y += (mouseY - y) * easing_y;
    } else {
      x += (default_x - x) * easing_x;
      y += (default_y - y) * easing_y;
    }
  }

  void display() {
    stroke(0);
    fill(hue, 100, 100, 100);
    ellipse(x, y, r, r);
  }
}



