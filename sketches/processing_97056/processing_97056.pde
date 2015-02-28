
void setup() {
  size (200, 200);
  background (0);
}

void draw() {
  noStroke();
  fill(255);
  rect (75, 75, 50, 50);
  fill(mouseX, 0, mouseY);
  ellipse(mouseX, mouseY, 10, 10);
  {
    if (mouseX>=75 && mouseX<=125 && mouseY>=75 && mouseY<=125)
      background(0);
  }
}
