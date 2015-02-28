
void setup() {
  smooth();
  size(200, 200);
}
void draw() {
  background(169,180,250);
  for (int i = 0; i <= 200; i += 25) {
    for (int j = 0; j <= 200; j += 25) {
      stroke(165,13,222);
      strokeWeight(8);
      triangle(mouseY, mouseX, i, j, i+10, j+20);
    }
    for (int j = 10; j <= 200; j += 30) {
      stroke(20,242,144);
      strokeWeight(3);
      triangle(i, j, mouseX, mouseY, i+20, j+10);
    }
  }
}
