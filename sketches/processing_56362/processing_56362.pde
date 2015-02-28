
void setup() {
  size(200, 200);
}
void draw() {
  background(255);
  multipleLine();
}

int myLine(int y) {
  for (int x=200; x>=0; x=x-5) {
    point(x, y);
  }
  return int(random(10));
}

void multipleLine() {
  for (int y=50; y<=150; y=y+10) {
    strokeWeight(myLine(y));
    myLine(y);
  }
}

