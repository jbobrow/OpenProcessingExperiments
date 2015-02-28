
void setup() {
  background(255);
  size(980, 980);
}

void draw() {
  if (mousePressed) {
    ellipse(mouseY, mouseY, mouseX, mouseY);
    noStroke();
  }else {
    ellipse(mouseX, mouseX, mouseX, mouseY);
    stroke(153);
  }
}


