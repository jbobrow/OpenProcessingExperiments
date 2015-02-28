
int a;
float b;

void setup() {
  size(300, 300);
}

void draw() {
  background(255);

  a = 0;
  b = 0.0;

  while (a < 300) {
    stroke(b*20, 0, 0);
    strokeWeight(b);
    point(a, 150);
    a = a + 50;
    b = b + 2.55;
  }
}
