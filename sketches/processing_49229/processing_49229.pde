
int n = 8;
int s = 50;
int t;
int y;

void setup() {
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
  background(360);

  smooth();
  strokeWeight(5);

  noLoop();
}

void draw() {
  make_tiles();

  t = int(random(n));
  y = int(random(n));

  fill(random(36)*10, 80, 100);
  rect(t*s, y*s, s, s);
}

void make_tiles() {
  for (int p = 0; p < n; p++) {
    for (int q = 0; q < n;q++) {
      noFill();
      rect(p*s, q*s, s, s);
    }
  }
}

void mousePressed() {  
  redraw();
}

void keyPressed() {
  background(360);
  redraw();
}


