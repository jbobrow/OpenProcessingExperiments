
void setup() {
  size(300,300);
  colorMode(RGB);
}

void draw() {
  background(0, 0, 0);
  for (int x=40; x<125; x+=2) {
    stroke(x);
    line(x, 20, x, 280);
  }
  for (int x=20; x<280; x+=20) {
    noFill();
    stroke(0,x,0);
    ellipse(x, 100, x, 50);
  }
}

