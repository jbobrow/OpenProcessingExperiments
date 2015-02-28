
void setup () {
  size (500, 500);
}
void draw () {
  stroke (0);
  fill(0);
  tete (30, 30, 30);
  tete (40, 40, 40);
  tete(60, 70, 60);
}
void tete(int pepe, float nene, float fofo) {
  pepe = pepe +1;
  nene = random (40);
  fofo=random (60);
  fill (nene+40, nene, nene+60);
  rect (mouseX, mouseY, pepe, nene);
  ellipse(mouseY, mouseX, pepe, fofo);
}


