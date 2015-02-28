
Circle[] circles = new Circle[400];

void setup() {
  size(400, 400);
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
  float goal_x;
  float goal_y;
  float x;
  float y;
  float hue = random(360);
  float t = random(TWO_PI);

  float easing_x = random(0.03, 0.07); //*1.5;
  float easing_y = random(0.03, 0.07); //*1.5;

  int r = 10;

  Circle() {
    x = default_x;
    y = default_y;

    goal_x = calc_x(t);
    goal_y = calc_y(t);
  }

  void move() {
    if (mousePressed == true) {
      x += (goal_x - x) * easing_x;
      y += (goal_y - y) * easing_y;
    } else {
      x += (default_x - x) * easing_x;
      y += (default_y - y) * easing_y;
    }
  }

  void display() {
    noStroke();
    fill(hue, 100, 100, 120);
    ellipse(x, y, r, r);
  }

  float calc_x(float heart_t) {
    float heart_x;
    float R = 10;

    heart_x = width/2 + R *(16 * sin(heart_t) * sin(heart_t) * sin(heart_t)) + random(-10, 10);

    return heart_x;
  }

  float calc_y(float heart_t) {
    float heart_y;
    float R = 10;

    heart_y = height/2 + (-1) * R * (13 * cos(heart_t) - 5 * cos(2*heart_t) - 2 * cos(3 * heart_t) - cos(4 * heart_t) ) + random(-10, 10);

    return heart_y;
  }
}

