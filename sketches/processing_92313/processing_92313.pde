
void setup() {
  size(400, 400);
}

void draw() {
  background(110, 250, 100, 250);
  fill(420, 80, 125, 124);
  ellipse(200, 200, 300, 300);
  stroke(0);
  fill(100);
  ellipse(150, 150, 75, mouseX / 5);
  ellipse(250, 150, 75, mouseY / 5);
  line(200, 200, 200, 220);
  smooth(4);
  strokeWeight(10);
  fill(209, 10, 125);
  stroke(100, 30, 200);
  rect(100, 250, 200, mouseX / 10);
}
