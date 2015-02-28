
int rc = 100;
int rm = 10;
int rd = 15;
float t = 0.0;

float x;
float y;

void setup() {
  size(300, 300);
  background(0);

  smooth();
}

void draw() {
  x = width/2 + (rc + rm) * cos(t) - rd * cos(((rc + rm) * t)/rm);
  y = height/2 + (rc + rm) * sin(t) - rd * sin(((rc + rm) * t)/rm);

  noFill();
  stroke(random(256), random(256), random(256));
  ellipse(x, y, 15, 15);

  t += 0.1;

  if (mousePressed == true) {
    background(0);
    t = 0.0;
  }
}


