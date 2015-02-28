
//Variables
int radius = 25;
float x = -radius;
float speed = 25;
float noradian = 0;
float radian1 = 0.79;
float radian2 = TWO_PI-QUARTER_PI;
float radian3 = 0.0;
float radian4 = TWO_PI;

void setup() {
  size(480, 120);
  ellipseMode(RADIUS);
  frameRate(8);
}

void draw() {
  //Condiciones para las variables (en orden)
  noradian = radian1;
  radian1 = radian3;
  radian3 = noradian;
  noradian = radian2;
  radian2 = radian4;
  radian4 = noradian;

  background(37,88,197);
  x += speed;
  if (x > width + radius) {
    x = -radius;
  }
  fill (242, 240, 0);
  noStroke();
  arc(x, 60, radius, radius, radian1, radian2);
}
