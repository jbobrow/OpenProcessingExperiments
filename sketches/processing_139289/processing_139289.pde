
float a = 200;
float b = 200;
float c = 200;
float d = 200;
float e = 200;
float f = 200;
float g = 200;
float h = 200;

void setup() {
  size(400, 450);
  noStroke();
}

void draw() {
  background(255);

  fill(a, b, c);
  ellipse(25, a, 50, 50);
  fill(b, c, d);
  ellipse(75, b, 50, 50);
  fill(c, d, e);
  ellipse(125, c, 50, 50);
  fill(d, e, f);
  ellipse(175, d, 50, 50);
  fill(e, f, g);
  ellipse(225, e, 50, 50);
  fill(f, g, h);
  ellipse(275, f, 50, 50);
  fill(g, h, a);
  ellipse(325, g, 50, 50);
  fill(h, a, b);
  ellipse(375, h, 50, 50);

  a = a + random(-10, 10);
  b = b + random(-5, 5);
  c = c + random(-10, 10);
  d = d + random(-5, 5);
  e = e + random(-10, 10);
  f = f + random(-5, 5);
  g = g + random(-10, 10);
  h = h + random(-5, 5);
} 



