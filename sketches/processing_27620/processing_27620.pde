
void setup() {
  size(400, 400);
  background(255, 0, 255);
}

void draw() {
  fill(255, 0, 0, 50);
  noStroke();
  rectMode(CENTER);
  rect(200, 200, 300, 200, mouseX, mouseY);
  fill(0, 0, 255, 50);
  stroke(0, 0, 255);
  ellipseMode(CENTER);
  ellipse(200, 200, 300, 300);
  fill(0, 255, 0, 30);
  noStroke();
  rectMode(CENTER);
  rect(200, 200, 200, 300, mouseX, mouseY);
}


