
float t = 0;
float r1 = 10;
float r2 = 8;

void setup() {
  size(420, 420);
  background(255);
  smooth();
  noStroke();

  frameRate(100);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);


  stroke(255,random(255), random(255));
  line(calc_x(r1), calc_y(r1), calc_x(r2), calc_y(r2));

  popMatrix();

  t += 0.01;
}

float calc_x(float r) {
  float x;

  x = r *(16 * sin(t) * sin(t) * sin(t)) + random(-5, 5);

  return x;
}

float calc_y(float r) {
  float y;

  y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) ) +  random(-5, 5);

  return y;
}

