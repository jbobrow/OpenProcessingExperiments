
Circle[] circles = new Circle[5000];

color bgcolor;
float hue = random(360);
boolean draw_flg = true;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);

  bgcolor = color(360);

  for (int i = 0; i < circles.length; i++) {
    circles[i] = new Circle(hue);
  }

  noStroke();
}

void draw() {
  if (draw_flg == true) {
    background(360);

    for (int i = 0; i < circles.length; i++) {
      circles[i].display();
    }
    draw_flg = false;
  }
}

void mousePressed() {
  hue = random(360);
  for (int i = 0; i < circles.length; i++) {
    circles[i].hue = hue;
    circles[i].choice();
  }
  draw_flg = true;
  draw();
}

class Circle {
  float x;
  float y;
  float r;
  float t;
  float R;
  float hue;
  float sat = random(50, 100);
  float brt = random(50, 100);

  Circle(float tmpHue) {
    hue = tmpHue;
    choice();
  }

  void display() {
    if (whiteChecker(x, y, r)) {
      fill(hue, sat, brt);
      ellipse(x, y, r, r);
    }
  }

  void choice() {
    if (random(1) > 0.3) {
      r = random(5, 10);
    } else {
      r = random(10, 20);
    }

    t = random(360);
    R = random(10);

    x = width/2 + R *(16 * sin(radians(t)) * sin(radians(t)) * sin(radians(t)));
    y = height/2 + (-1) * R * (13 * cos(radians(t)) - 5 * cos(radians(2*t)) - 2 * cos(radians(3 * t)) - cos(radians(4 * t)));
  }

  boolean whiteChecker(float x, float y, float r) {
    color c;

    for (float i = x-r/2; i < x+r/2; i++) {
      for (float j = y-r/2; j < y+r/2; j++) {
        c = get((int)i, (int)j);
        if (c != bgcolor) {
          return false;
        }
      }
    }
    return true;
  }
}



