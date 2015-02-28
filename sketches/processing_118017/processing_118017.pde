
Ribbon[] ribbons = new Ribbon[80];

void setup() {
  size(800, 180);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  strokeCap(PROJECT);

  for (int i = 0 ; i < ribbons.length;i++) {
    ribbons[i] = new Ribbon();
  }
}

void draw() {
  //background(360);
  noStroke();
  fill(360, 80);
  rect(0, 0, width, height);

  for (int i = 0 ; i < ribbons.length;i++) {
    ribbons[i].move();
    ribbons[i].display();
  }
}

class Ribbon {
  float x = random(width);
  float y = 0;
  float w = random(150, 300);
  float h = random(50, 300);
  float hue = random(360);
  float theta = 0;
  float theta_delta = random(0.01, 0.05)*3;
  int theta_sign = 1;
  float st_w = random(5, 20);

  Ribbon() {
  }

  void move() {
    strokeWeight(st_w);
    theta += theta_sign * theta_delta;
    if (theta > PI+radians(30)) {
      theta = PI+radians(30);
      theta_sign *= -1;
    }
    if (theta < -radians(30)) {
      theta = -radians(30);
      theta_sign *= -1;
      setting();
    }
  }

  void display() {
    noFill();
    stroke(hue, 50, 100, 50);
    arc(x, y, w, h, 0, theta);
  }

  void setting() {
    x = random(width);
    y = 0;
    w = random(150, 300);
    h = random(50, 300);
    hue = random(360);
    theta_delta = random(0.01, 0.05)*3;
    st_w = random(5, 20);
  }
}



