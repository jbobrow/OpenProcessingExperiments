
void setup() {
  size(600,600);
  colorMode(HSB,360000);
}

void draw() {
  background(color(mouseX*mouseY, 360000, 360000));
}
