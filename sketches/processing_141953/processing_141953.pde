
void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  line(random(0, 250), random(0, 250), 250, 250);
  stroke(random(255), 0, 0, random(255));
  line(random(250, 500), random(0, 250), 250, 250);
  stroke(0, random(255), 0, random(255));
  line(random(0, 250), random(250, 500), 250, 250);
  stroke(0, 0, random(255), random(255));
  line(random(250, 500), random(250, 500), 250, 250);
  stroke(random(100, 255), 0, random(100, 255), random(255));
}

