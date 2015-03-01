
void setup() {
  size(500, 500);
}

void draw() {
  noStroke();
  fill(#ec7263, 20);
  rect(0, 0, width, height);
  int edges = (int)map(mouseX, 0, width, 1, 40);
  recursiveCirle(width/2, height/2, 250, edges);
}

void recursiveCirle(int x, int y, int r, int edges) {
  polygon(x, y, r, edges);
  if (r>10) {
    recursiveCirle(x+r/2, y, r/2, edges);
    recursiveCirle(x-r/2, y, r/2, edges);
    recursiveCirle(x, y+r/2, r/2, edges);
    recursiveCirle(x, y-r/2, r/2, edges);
  }
}


void polygon(int x, int y, int r, int edges) {
  noFill();
  stroke(#57385c, 20);
  beginShape();
  for (int i=0; i<edges; i++) {
    float xm = x + r*sin(i*TWO_PI/edges);
    float ym = y + r*cos(i*TWO_PI/edges);
    vertex(xm, ym);
  }
  endShape(CLOSE);
}

