
void setup() {
  size(300, 300);
  background(0);
  noStroke();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  float a = random(10, 20);
  for (int j=0; j<10; j++) {
    ellipse(random(width+50), random(height+50), a, a);
    fill(0, random(100, 200), random(100, 200));
  }
  filter(BLUR, 2);
}


