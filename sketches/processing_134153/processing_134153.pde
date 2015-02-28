
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    fill(mouseX,random(8),random(7),random(6));
  } else {
    fill(random(254),random(315),random(235));
  }
  ellipse(mouseX, mouseY, 80, 80);
}
