
void setup() {
  size(680,680);
}

void draw() {
  if (mousePressed) {
    fill(293,365,258);
  } else {
    fill(random(255),384,354,367);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
