
float x = 0;
float y = 0;
float a = 0;
float b = 0;
float c = 0;

void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  background(0);
  translate(width/2, height/2);
  for (x = 0; x < width; x ++) {
    stroke(x, y, a + b);
    y = c*10;
    for (a = 0; a < width; a ++) {
    b = x * tan(c);
    }
    line(x, y, a, b);
    rotate(radians(30));
    }
  c += 0.01;
  if (mousePressed) {
    c = 0;
  }
}

