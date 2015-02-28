
Circle[] circles = new Circle[700];

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);

  for (int i = 0 ; i < circles.length;i++) {
    circles[i] = new Circle();
  }

  noStroke();
}

void draw() {
  background(360);

  for (int i = 0 ; i < circles.length;i++) {
    circles[i].move();
    circles[i].display();
  }
}

class Circle {
  int r = 10;

  float default_x = random(width);
  float default_y = random(height);
  float goal_x;
  float goal_y;
  float x;
  float y;
  float hue = random(360);
  float t = random(TWO_PI);

  float spd_x = random(0.5, 1);
  float spd_sign_x;
  float spd_y = random(0.5, 1);
  float spd_sign_y;

  float easing_x = random(0.03, 0.07); 
  float easing_y = random(0.03, 0.07); 

  float n = 20;
  float d = 5;

  Circle() {
    x = default_x;
    y = default_y;

    goal_x = calc_x(t);
    goal_y = calc_y(t);

    if (random(1) >= 0.5) {
      spd_sign_x = 1;
    } else {
      spd_sign_x = -1;
    }

    if (random(1) >= 0.5) {
      spd_sign_y = 1;
    } else {
      spd_sign_y = -1;
    }
  }

  void move() {
    if (mousePressed == true) {
      x += (goal_x - x) * easing_x;
      y += (goal_y - y) * easing_y;
    } else {
      default_x += spd_sign_x * spd_x;
      default_y += spd_sign_y * spd_y;

      if (default_x < 0 || default_x > width) {
        spd_sign_x *= -1;
      }
      if (default_y < 0 || default_y > height) {
        spd_sign_y *= -1;
      }

      x += (default_x - x) * easing_x;
      y += (default_y - y) * easing_y;
    }
  }

  void display() {
    fill(hue, 100, 100, 150);
    ellipse(x, y, r, r);
  }

  float calc_x(float flower_t) {
    float flower_x;
    float R = 200 * sin(flower_t * n / d);

    flower_x = width/2 + R * cos(flower_t);

    return flower_x;
  }

  float calc_y(float flower_t) {
    float flower_y;
    float R = 200 * sin(flower_t * n / d);

    flower_y = height/2 + R * sin(flower_t); 
    return flower_y;
  }
}

