
Circle[] circle = new Circle[1000];

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  for (int i = 0 ; i < circle.length;i++) {
    circle[i] = new Circle();
  }
}

void draw() {
  noStroke();
  fill(0, 80);
  rect(0, 0, width, height);

  for (int i = 0 ; i < circle.length;i++) {
    circle[i].move();
    circle[i].display();
  }
}

class Circle {
  float x;
  float y;
  float r;
  float easingX;
  float easingY;

  Circle() {
    r = random(1, 20);
    easingX = random(0.005, 0.05);
    easingY = random(0.005, 0.5);
  }

  void move() {
    float targetX = mouseX;
    float targetY = mouseY;
    x += (targetX - x) * easingX;
    y += (targetY - y) * easingY;
  }

  void display() {
    fill(360);
    noStroke();
    ellipse(x, y, r, r);
  }
}



