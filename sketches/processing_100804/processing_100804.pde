
int randsens = 3;
int hrip1 = 5;
int wrip1 = 5;
int x1, y1, x2, y2, x3, y3;

void setup() {
  size (800, 600);
  smooth();
  x1 = int(random(width));
  y1 = int(random(height));
  x2 = int(random(width));
  y2 = int(random(height));
  x3 = int(random(width));
  y3 = int(random(height));
}

void draw() {
  int chrip = int(random(2));
  background(70, 80, 90);
  randompoints();
  linesnet();
  polyform();
  bubbles();
  if (chrip == 1) {
    ripple();
    }
}

void randompoints() {
  x1 += int(random(-randsens, randsens));
  y1 += int(random(-randsens, randsens));
  x2 += int(random(-randsens, randsens));
  y2 += int(random(-randsens, randsens));
  x3 += int(random(-randsens, randsens));
  y2 += int(random(-randsens, randsens));
}  

void linesnet() {
  stroke(127);
  line(x1, y1, width, height);
  line(x1, y1, width, 0);
  line(x1, y1, 0, height);
  line(x1, y1, 0, 0);
  line(x2, y2, width, height);
  line(x2, y2, width, 0);
  line(x2, y2, 0, height);
  line(x2, y2, 0, 0);
  line(x3, y3, width, height);
  line(x3, y3, width, 0);
  line(x3, y3, 0, height);
  line(x3, y3, 0, 0);
}

void polyform() {
  stroke(255);
  line(x1, y1, x2, y2);
  line(x2, y2, x3, y3);
  line(x3, y3, x1, y1);
}

void bubbles() {
  noStroke();
  fill(150, 150, 200, 30);
  ellipse(x1, y1, int(random(100,200)), int(random(100,200)));
  ellipse(x2, y2, int(random(100,200)), int(random(100,200)));
  ellipse(x3, y3, int(random(100,200)), int(random(100,200)));
}
void ripple() {
  stroke(150, 150, 200, 30);
  noFill();
  int xrip1 = x1;
  int yrip1 = y1;
  hrip1++;
  wrip1++;
  ellipse(xrip1, yrip1, hrip1, wrip1);
}


