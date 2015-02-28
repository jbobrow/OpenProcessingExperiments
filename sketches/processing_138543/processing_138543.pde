
void setup() {
  size(500, 500);
  rectMode(CENTER);
  stroke(30, 40);
  fill(255, 100, 50);
}

void draw () {
  background(0);
  translate(width / 2, height / 2);
  for (int s = 200; s > 0; s = s - 10) {
    fill(random(255), random(255 - s), random (255 - s));
    rotate((mouseX + mouseY) / 300.0);
    rect(0, 0, s, s);
  }
}


