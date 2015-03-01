
void setup() {
  background(0);
  size(500, 500);
  frameRate(10000);
}
float a = random(4000.0, 6000.0);
float b = random(4000.0, 6000.0);
float c = random(4000.0, 6000.0);
float a1 = random(-2, 1);
float b1 = random(-2, 1);
float c1 = random(-2, 1);
float a2 = random(30, 70);
float b2 = random(30, 70);
float c2 = random(30, 70);
float xoff = 0.0;

void draw() {
  noStroke();
   xoff = xoff + .01;
  float n = noise(xoff) * 385;
  background(0, 50, 0);
  translate(250, 250);
  rotate(millis()/a);
  fill(0, 250, 0, 100);
  arc(0, 0, n+a2, n+a2, a1, HALF_PI);
  rotate(millis()/b);
  fill(0, 200, 0, 100);
  arc(0, 0, n+b2, n+b2, b1, HALF_PI);
  rotate(millis()/c);
  fill(0, 150, 0, 100);
  arc(0, 0, n+c2, n+c2, c1, HALF_PI);
  fill(0, 50, 0);
  ellipse(0, 0, n, n);
}



