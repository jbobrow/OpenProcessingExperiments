
void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  float s = dist(mouseX, mouseY, pmouseX, pmouseY) + 1;
  fill(random(255),random(255), random(255), 150);
  noStroke();
  rectMode(CENTER);
  rect(mouseX, mouseY, s, s);
  point(mouseX, mouseY);
}


