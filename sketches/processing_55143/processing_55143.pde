
void setup() {
  size(500, 500);
  background(0);
}

void draw() {
  if (mousePressed) {
    fill(0,0,0);
    stroke(0,0,255);
    ellipse(mouseX, mouseY,2,2);
  } else {
    fill(0,0,0);
    stroke (255,255,255);
  }
  ellipse(mouseX, mouseY, 10, 10);
}

void mouseClicked () {
  background(000000);
}


