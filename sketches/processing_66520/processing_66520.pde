
int x;
int y;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  //one: create integer; two: test; third: do once per loop at the end
  x = 350;
  y = 0;
  for (int i = 0; i < 500; i += 40) {
    x -= 25;
    ellipse(i, 250, x/8, x/8);
  }
  for (int i = 0; i < 500; i += 40) {
    y +=25;
    ellipse(250, i, y/8, y/8);
  }
}

void draw() {
}


