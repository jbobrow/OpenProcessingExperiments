
void setup() {
  size(200, 200);
  background(#EAE080);
}
void draw() {
  stroke(0);
  fill(mouseX/2, 100, mouseY*6, 100);
  for (float i =150; i < 200; i += 5) {
    fill(mouseX*7, 155, mouseY*2, 255);
    triangle(mouseX, mouseY, mouseX, mouseY, mouseX, mouseY);
    triangle(mouseX, mouseY, 60, 60, 30, 30);
  }
}
