
void setup() {
  smooth();
  size(200, 200);
}
void draw() {
  background(277,166,11);
  for (int i = 0; i <= 200; i += 25) {
    for (int j = 0; j <= 200; j += 25) {
      stroke(277,11,11);
      strokeWeight(8);
      triangle(mouseY, mouseX, i, j, i+10, j+20);
    }
    for (int j = 10; j <= 200; j += 30) {
      stroke(227,209,11);
      strokeWeight(3);
      triangle(i, j, mouseX, mouseY, i+20, j+10);
    }
  }
}
