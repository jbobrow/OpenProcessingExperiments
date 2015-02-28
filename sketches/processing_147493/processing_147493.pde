
void setup() {
  size(500, 500);
  background(255);
  frameRate(15);
}

float count = 500;

void draw() {
  noStroke();
  fill(255, 15);
  rect(0, 0, 500, 500);
  count = count - 20;
  translate(250, 250);
  rotate(count/10);
  fill(0, count/1.8, 20, 50);
  ellipse(random(0, 10), random(0, 10), count, count);
  if (count < 20) {
    count = 500;
  }
  filter(ERODE);
}

