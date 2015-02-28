
void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  noStroke();
  rect(mouseX, 250, 10, mouseX/2);
  fill(mouseX/2+100, 0, 0);
  rect(mouseX, 250, 10, -mouseX/2);
  fill(mouseX/2+100, 0, 0);
  filter(BLUR, mouseX/200);
}
