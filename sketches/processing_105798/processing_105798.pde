
int x;
int y;

void setup() {
  size(800, 800);
  background(100, 100, 100);
  fill(#FFFFFF);
  noStroke();
  x=0;
}

void draw() {
  background(0);

  for (int i=0; i <=20; i++) {
    y=i*40;
    rect(x, y, 40, 40);
    x = x + 40;
    if (x==800) {
      x=0;
    }
  }
}
