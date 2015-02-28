
int rc = 100;
int rm = 65;
int rd = 100;
float t = 0.0;

float x;
float y;

int c = 0;

void setup() {
  size(300, 300);
  background(0);

  smooth();
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  float es = random(30, 50); 

  noFill();
  stroke(c*10, 100, 100);

  x = width/2 + (rc - rm) * cos(t) + rd * cos(((rc - rm) * t)/rm);
  y = height/2 + (rc - rm) * sin(t) - rd * sin(((rc - rm) * t)/rm);

  ellipse(x, y, 15, 15);

  t += 0.1;
  c++;

  if (c > 36) {
    c = 0;
  }

  if (mousePressed == true || t > 82) {
    background(0);
    t = 0.0;
  }
}


