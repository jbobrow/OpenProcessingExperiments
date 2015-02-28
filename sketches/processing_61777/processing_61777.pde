
public void setup() {
  size(500, 500);
  smooth();
}

public void draw() {
  noStroke();
  fill(255, 32);
  rect(0, 0, 500, 500);
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY, 100, 100);
}
