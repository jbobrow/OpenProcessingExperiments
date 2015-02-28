
void setup () {
  size (800, 800);
}

void mojaFunkcja(int x, int y) {
  ellipseMode(CENTER);
  translate (width/2,height/2);
  rotate (mouseX + mouseY);
  fill (255, mouseX);
  ellipse(0, 0, mouseY/2, mouseX);
}

void draw () {
  background (mouseX, mouseY, noise(20));
  for (int i = 0; i < 1000; i++) {
  mojaFunkcja (i,20);
  }
}
