

ArrayList circles;

void setup() {
  size(400, 400);
  noStroke();
  circles = new ArrayList();
  for (int i=0; i<10; i++) {
    circles.add(new Circle(0f, 0f, 5*i, 36*i));
  }
}

void draw() {
  background(255);
  for (int i=0; i<circles.size(); i++) {
    Circle c = (Circle)circles.get(i);
    c.move();
    c.display();
  }
}

class Circle {
  float x, y, w, angle;
  float r = 50;
  Circle(float x, float y, float w, float angle) {
    this.x = x + r * sin(radians(angle));
    this.y = y - r * cos(radians(angle));
    this.w = w;
    this.angle = angle;
  }

  void move() {
    if (angle > 360) {
      angle = 0;
    }
    x = mouseX + r * sin(radians(angle));
    y = mouseY - r * cos(radians(angle));
    angle += 4;
  }

  void display() {
    fill(0, 0, random(255));
    ellipse(x, y, w, w);
  }
}


