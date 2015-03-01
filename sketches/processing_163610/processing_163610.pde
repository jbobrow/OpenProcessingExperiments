
void setup() {
  size(300,200);
  stroke(255);
}


void draw() {
  background(0);
  float s = map(second(), 0, 60, 0, 300);
  float m = map(minute(), 0, 60, 0, 300);
  float h = map(hour(), 0, 24, 0, 300);

  line(s, 0, s, 66);
  line(m, 67, m, 136);
  line(h, 137, h, 200);
}
