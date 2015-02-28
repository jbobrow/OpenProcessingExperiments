
void setup() {
  size(500, 500);
}

void draw() {
  //background(255);
  //si côté gauche => cercle, si côté droit => rectangle
  if (mouseX>width/2) {
    fill(#00ff00);
    stroke(#0000ff);
    rect(mouseX, mouseY, 20, 20);
  }
  if (mouseX<width/2) {
    fill(#0000ff);
    stroke(#00ff00);
    ellipse(mouseX, mouseY, 20, 20);
  }
}

