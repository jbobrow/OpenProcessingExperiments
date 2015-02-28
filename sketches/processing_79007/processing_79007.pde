
void setup () {
  size (480, 120);
  smooth ();
  text ("ALEX CHERTOFF", 50, 30);
}

void draw () {
  if (mousePressed) {
    fill (0);
  } else {
    fill (255);
  }
  ellipse (mouseX, mouseY, 88, 80);
}


