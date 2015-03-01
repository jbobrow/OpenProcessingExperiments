
void setup() {
  size(300,300);
  stroke(255);
}

void draw() {
  
  float s = map(second(), 0, 60, 0, 100);
  float m = map(minute(), 0, 60, 0, 100);
  float h = map(hour(), 0, 24, 0, 100);
  background(s*10, 10*s, 50+s);
  ellipse(s, 10, s*TWO_PI, 33);
  ellipse(m, 100, m, 66);
  ellipse(h, 250, h, 100);
}


