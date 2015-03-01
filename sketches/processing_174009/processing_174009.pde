
int SIZE;
float r;
float a;
int T;
color randCol;
int shape;

void setup() {
  size(740, 340);
  background(45);
  fill(0);
  smooth();
  frameRate(200);
  colorMode(HSB);
  SIZE = 150;
  r = 0;
  a = 0;
  T = int(random(0, 255));
  shape = int(random(1, 5));
}

PVector shape01(float a, float r) {
  float M1 = 0.40;
  float M2 = 0.399993;
  PVector coords = new PVector(0, 0);
  coords.x = r / sin(a*M1) / 8;
  coords.y = r / cos(a*M2) / 8;
  return coords;
}
PVector shape02(float a, float r) {
  float M1 = 0.40;
  float M2 = 0.399993;
  PVector coords = new PVector(0, 0);
  coords.x = r / sin(a*M1) / 8;
  coords.y = r / cos(a*M1) / 8;
  return coords;
}
PVector shape03(float a, float r) {
  float M1 = 0.40;
  float M2 = 0.399993;
  PVector coords = new PVector(0, 0);
  coords.x = r / sin(a*M1) / 8;
  coords.y = r / cos(a-M2) / 8;
  return coords;
}
PVector shape04(float a, float r) {
  float M1 = 0.40;
  float M2 = 0.399993;
  PVector coords = new PVector(0, 0);
  coords.x = r / sin(a*M1);
  coords.y = r / tan(a*M2-1);
  return coords;
}


void drawShape() {
  PVector coords = new PVector(0, 0);
  a += 41;
  r += 0.15;
  float canvas_scale = 0.01;

  colorMode(HSB);
  float color_T = map(T, 0, 1000, 0, 255);
  fill(color_T, 255-color_T/2, 255);

  if (shape == 1) coords = shape01(a, r);
  if (shape == 2) coords = shape02(a, r);
  if (shape == 3) coords = shape03(a, r);
  if (shape == 4) coords = shape04(a, r);

  pushMatrix();
  translate(width/2, height/2);
  scale(canvas_scale);
  ellipse(coords.x, coords.y, SIZE, SIZE);
  popMatrix();
}

void draw() {
  T += 1;
  int count = 100;
  if (shape == 2 || shape == 3) {
    count = 1000;
  }
  for (int i=0; i<count; i++) {
    drawShape();
  }
  println(shape);
}

void mousePressed() {
  background(45);
  setup();
}

