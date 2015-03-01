
void setup() {
  size(680,680);
}

void draw() {
  if (mousePressed) {
    fill(268,394,394);
  } else {
    fill(255,546,734);
  }
  ellipse(mouseX, mouseY, 10, 21);
  ellipse(mouseY, mouseX, 21, 10);
 
}
