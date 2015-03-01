
class Circle {
  int x, y, d;

  Circle(int x, int y, int d) {
    this.x = x;
    this.y = y;
    this.d = d;
  }
}

Circle c1, c2;

void setup() {
  size(520, 320);
  ellipseMode(CENTER);
  rectMode(CENTER);
  noFill();
  strokeWeight(1);

  c1 = new Circle(width/2, height/2, 80);
  c2 = new Circle(0, 0, 65);
}

void draw() {
  background(255);

  // border
  noFill();
  stroke(0);
  strokeWeight(2);
  rect(width/2, height/2, width-2, height-2);

  c2.x = mouseX;
  c2.y = mouseY;

  strokeWeight(1);

  if (intersection(c1, c2)) {
    stroke(255, 0, 0);
    fill(255, 128, 64, 32);
  }
  else {
    stroke(0);
    noFill();
  }

  ellipse(c1.x, c1.y, c1.d, c1.d);
  ellipse(c2.x, c2.y, c2.d, c2.d);
}

boolean intersection(Circle c1, Circle c2) {
  return dist(c1.x, c1.y, c2.x, c2.y) <= c1.d/2 + c2.d/2;
}

