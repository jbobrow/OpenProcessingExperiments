
Easing[] easing = new Easing[200];

void setup() {
  size(300, 300);
  colorMode(HSB, 360, 100, 100);
  background(360);

  for (int i = 0 ; i < easing.length;i++) {
    easing[i] = new Easing();
  }

  noStroke();
}

void draw() {
  background(360);

  for (int i = 0 ; i < easing.length;i++) {
    easing[i].move();
    easing[i].display();
  }
}

class Easing {
  Star star;

  float default_x = random(width);
  float default_y = random(height);
  float goal_x;
  float goal_y;
  float x;
  float y;
  float t = random(360);
  float hue = t;

  float spd_x = random(0.5, 1) / 1.5;
  float spd_sign_x;
  float spd_y = random(0.5, 1) / 1.5;
  float spd_sign_y;

  float easing_x = random(0.03, 0.07) / 1.5;
  float easing_y = random(0.03, 0.07) / 1.5;

  Easing() {
    star = new Star(hue);

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
    star.display(x, y);
  }

  float calc_x(float heart_t) {
    float heart_x;
    float R = 8;

    heart_x = width/2 + R *(16 * sin(radians(heart_t)) * sin(radians(heart_t)) * sin(radians(heart_t)));

    return heart_x;
  }

  float calc_y(float heart_t) {
    float heart_y;
    float R = 8;

    heart_y = (height/2-20) + (-1) * R * (13 * cos(radians(heart_t)) - 5 * cos(radians(2*heart_t)) - 2 * cos(radians(3 * heart_t)) - cos(radians(4 * heart_t)));

    return heart_y;
  }
}

class Star {
  int vertex_val = 5 * 2;
  float R;
  float R_out = random(10, 15);
  float R_in;

  float hue;
  float sat = random(30, 100);

  float theta = random(TWO_PI);
  float theta_spd = random(1, 3)/100;
  int theta_sign;

  Star(float tmpHue) {
    hue = tmpHue;

    if (random(1) >= 0.5) {
      theta_sign = 1;
    } else {
      theta_sign = -1;
    }
  }

  void display(float x, float y) {
    R_in = R_out / 1.6;

    stroke(360, 120);
    fill(hue, sat, 100, 120);

    pushMatrix();
    translate(x, y);
    rotate(theta);
    beginShape();
    for (int i = 0;i < vertex_val;i++) {
      if (i % 2 == 0) {
        R = R_out;
      } else {
        R = R_in;
      }
      vertex(R * cos(radians(360 * i / vertex_val)), R * sin(radians(360 * i /vertex_val)));
    }
    endShape(CLOSE);
    popMatrix();

    theta += theta_sign * theta_spd;
  }
}

