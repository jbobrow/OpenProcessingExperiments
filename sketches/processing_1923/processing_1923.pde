
float x = 0;
float y = 0;
float a = 0;
float c = 0;

void setup() {
  size(400, 400);
  background(0);
  smooth();
  frameRate(10);
}

void draw() {
  translate(width/2, height/2);
  for (x = 0; x < width; x += 25) {
  y = sin(c)*c;
  fill(206, 8, 25);
  strokeWeight(2);
  stroke(219 + c, 103 + c, 31 - c, c);
  rotate(radians(random(180)));
  ellipse(0, 0, c/x + a, c + a);
  fill(252, 224, 181, 150);
  ellipse(0, 0, x - c, y - c);
  }
  c = c + random(-0.3, 0.5);
  a += 0.2;
  if (mousePressed) {
    background(0);
    a = 0;
    c = 0;
  }
}

