
void setup() {
  size(500, 500);
}

void draw() {
  if (mousePressed) {
    stroke(random(0, 255), random(0, 255), random(0, 255));
    line(mouseX+4, mouseY+4, mouseX-4, mouseY-4);
    line(mouseX-4, mouseY+4, mouseX+4, mouseY-4);
    line(mouseX-5, mouseY, mouseX+5, mouseY);
    line(mouseX, mouseY+5, mouseX, mouseY-5);
  } else {
    fill(random(0, 255), random(0, 255), random(0, 255));
    noStroke();
    ellipse(mouseX, mouseY, 10, 10);
  }
}


