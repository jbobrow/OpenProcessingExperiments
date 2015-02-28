
ArrayList points;

float t = 0;

float dt = 0.03;

void setup() {
  background(152,255,163);

  size(400, 400);

  colorMode(HSB, 2 * PI, 1, 1, 1);

  noStroke();

}

void draw() {
  clear();

  fill(255,100,1,0.3);

  randomSeed(10);

  for (int i = 0; i < 1800; i++) {

    particle(t);

  }

  t += dt;

}

void clear() {
  //background(0,0,0);
  fill(0, 0, 0, 0.05);
  rect(0, 0, width, height);

}

void particle(float t) {

  float x = random(-1, 1);

  float y = random(-1, 1);

  float d = 0;

  float xx = map(x*cos(y*t - cos(t*x)), -1, 1, 0, width);

  float yy = map(y*cos(x*t - cos(t*y)), -1, 1, 0, height);

  d = 0.5 + 3 * x*cos(y*t);

  ellipse(xx, yy, d, d);

}

void mousePressed() {

  t = 0;

}
