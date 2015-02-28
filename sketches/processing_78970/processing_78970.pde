
void setup() {
  size (400, 120);
  smooth();
  text ( "Michael Iacobucci", 50, 30);
  fill (0, 102, 153, 51);
}

void draw () {
  if (mousePressed) {
    fill(8);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80,80);
}


