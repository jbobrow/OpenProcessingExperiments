
void setup() {
  size(1000, 1000);
  smooth();
}

void draw() {
  background(0);

  float s = map(second(), 0, 60, 0, 360);
  float m = map(minute(), 0, 60, 0, 360);
  float h = map(hour(), 0, 24, 0, 360);

  noFill();
  stroke(255);

  for (int i = 0; i < 600; i += 3) {
    translate(width/2, height/2);
    rotate(radians(s));
    ellipse(0, 0, 800 - i, 800 - i);
    rotate(radians(m));
    ellipse(0, 0, 400 - i, 400 - i);
    rotate(radians(h));
    ellipse(0, 0, 200 - i, 200 - i);
  }
  println(h, m, s);
}

