
int steps = 10;
int side;
int x, y, px, py;
int b = 40;
int incr;

void setup() {
  size(600, 600);
  background(220);
  colorMode(HSB);
  incr = int((255-40)/7);

  noFill();
  noStroke();
}

void draw() {
  side = width/steps;
  x = floor(mouseX/side);
  y = floor(mouseY/side);
  if (x != px) {
    //fill(random(255), b, b);
    fill(random(b, b+incr), 255, 255);
    stroke(255);
  }
  if (y != py) {
    fill(random(b, b+incr), 255, 255);
    stroke(255);
  }
  px = x;
  py = y;
  rect(x*side, y*side, side, side);
}

void mouseClicked() {
  b += incr;
  if (b > 255) {
    b = 40;
  }
  steps++;
  if (steps > 17) {
    steps = 17;
  }
}

void keyPressed() {
  save(random(5555) + ".gif");
}
