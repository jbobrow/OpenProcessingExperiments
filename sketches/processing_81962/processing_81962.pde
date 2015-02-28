
int diam, space;
float r, g, b;

void setup() {
  size(800, 600);
  smooth();
  noLoop();
}

void draw() {
  background(230);
  noFill();
  stroke(1);
  r = random(10, 240);
  g = random(10, 245);
  b = random(10, 250);
  if (r == g || r == b || b == g) {
    r = r + 2;
    g = g + 2;
    b = b - 4;
  }
  diam = (int)random(3, 50);
  space = diam*2;
  for (float x = space; x < width - space; x += space) {
    for (float y = space; y < height - space; y += space) {
      noStroke();
      fill(random(10, 240), random(10, 245), random(10, 250));
      ellipseMode(CORNER);
      ellipse(x, y, diam, diam);
    }
  }
}

void mousePressed() {
  setup();
  redraw();
}



