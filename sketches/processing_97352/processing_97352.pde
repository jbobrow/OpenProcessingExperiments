
final static int MAX_CIRCLE = 1000;
ArrayList<Circle> circles = new ArrayList<Circle>();


void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  background(0);
  smooth();

  for (int i = 0 ; i <MAX_CIRCLE;i++) {
    circles.add(new Circle());
  }
}

void draw() {
  noStroke();
  fill(0, 80);
  rect(0, 0, width, height);

  for (Circle circle:circles) {
    circle.move();
    circle.display();
  }
}

class Circle {
  final static float MIN_EASING_RATIO = 0.005;
  final static float MAX_EASING_RATIO = 0.05;
  final static int MIN_RADIUS = 1;
  final static int MAX_RADIUS = 20;
  PVector position = new PVector(0, 0);
  PVector easing;

  float r;

  Circle() {
    r = random(MIN_RADIUS, MAX_RADIUS);
    easing = new PVector(random(MIN_EASING_RATIO, MAX_EASING_RATIO), random(MIN_EASING_RATIO, MAX_EASING_RATIO));
  }

  void move() {
    PVector mousePosition = new PVector(mouseX, mouseY);
    position.add(PVector.mult(PVector.sub(mousePosition, position), easing));// POSITION += (MOUSE_POSITION-POSITION) * EASING
  }

  void display() {
    fill(360);
    noStroke();
    ellipse(position.x, position.y, r, r);
  }
}

