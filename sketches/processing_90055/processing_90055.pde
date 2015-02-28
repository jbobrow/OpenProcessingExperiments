
void setup() {
  size(500, 500);
  smooth();
  background(0);
}

void draw() {
  float s = map(second(), 0, 60, 0, 500);
  float m = map(minute(), 0, 60, 0, 500);
  float h = map(hour(), 0, 24, 0, 500);
  
  fill(255, random(222), random(248), random(40));
  noStroke();
  ellipse(s, 115, s, s);
  ellipse(m, 270, m, m);
  ellipse(h, 425, h, h);
}


