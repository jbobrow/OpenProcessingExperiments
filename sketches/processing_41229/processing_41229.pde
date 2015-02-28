
color c = color(222, 234, 85);
float a = 15;
float b = 100;
float speed = 4;

void setup() {
  size(300, 150);
}

void draw() {
  background(244, 181, 252);
  move();
  display();
}

void move() {
  a = a + speed;
  if (a > width) {
    a = 0;
  }
}

void display() {
  stroke (10);
  fill (c);
  rect (30, a+20, b, 30);
  fill (c);
  rect (b-25, 60, 40, a);
  fill (181, 199, 252);
  noStroke ();
  ellipse (200, a+50, b+30, b+a);
  fill (181, 199, 252);
  ellipse (a, b, 30, 10);
   fill (181, 199, 252);
  ellipse (a, b+50, 30, 10);
   fill (181, 199, 252);
  ellipse (a, b+30, 30, 10);
   fill (181, 199, 252);
  ellipse (a, b+40, 30, 10);
}

