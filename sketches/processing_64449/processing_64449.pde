


void setup() {
  size(500, 500);
  noFill();
  smooth();
  //strokeWeight(2);
  colorMode(HSB, 100);
  background(0);
}

void draw_circ(int x, int y, int maxd) {


  color c1 = color(random(100), 100, 100);
  color c2= color(random(100), 100, 30);

  for (int d=0; d<maxd; d++) {
    float n=map(d, 0, maxd, 0, 1);
    color newc=lerpColor(c1, c2, n);
    stroke(newc);

    ellipse(x, y, d, d);
  }
}
void draw() {
}
void mousePressed() {
  draw_circ(mouseX, mouseY, 200);
}


