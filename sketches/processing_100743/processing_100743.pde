
float x;
float y;

float t = 0;
float R = 10;

float r = 10;

void setup() {
  size(420, 420);
  colorMode(HSB, 360, 100, 100);
  background(360);
  smooth();
  noStroke();

  frameRate(500);
}

void draw() {
  R = random(10);
  t = random(TWO_PI);

  pushMatrix();
  translate(width/2, height/2);

  calc(t);

  noStroke();
  if (random(1) > 0.3) {
    r = random(10);
    fill(mag(x, y)*2, 50, 100);
  } else {
    r = random(5);
    fill(360);
  }
  ellipse(x, y, r, r);

  popMatrix();
}

void calc(float t) {
  // t = 0 -> x = 210 , y = 160
  x = R *(16 * sin(t) * sin(t) * sin(t)) + random(-5, 5);
  y = -1 * R * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) ) +  random(-5, 5);
}

