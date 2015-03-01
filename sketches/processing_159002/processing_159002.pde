
void setup() {
  background(0);
  size(500, 500);
}
float a = random(4000.0, 6000.0);
float b = random(4000.0, 6000.0);
float c = random(4000.0, 6000.0);
float a1 = random(-2, 1);
float b1 = random(-2, 1);
float c1 = random(-2, 1);
float xoff = 0.0;

void draw() {
  noStroke();
   xoff = xoff + .01;
  float n = noise(xoff) * 385;
  background(255);
  translate(250, 250);
  rotate(millis()/a);
  fill(255, 0, 0, 100);
  arc(0, 0, 400, 400, a1, HALF_PI);
  rotate(millis()/b);
  fill(0, 255, 0, 100);
  arc(0, 0, 400, 400, b1, HALF_PI);
  rotate(millis()/c);
  fill(0, 0, 255, 100);
  arc(0, 0, 400, 400, c1, HALF_PI);
  fill(255);
  ellipse(0, 0, n, n);
}



