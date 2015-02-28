
void setup() {
  size(1080, 1080);
  smooth();
  background(10, 20);
}

void draw() {
if (mousePressed) {
  fill(22, 146, 145, 100);
} else {
  fill(200);
  fill(270, 400, 50, 100);
}
ellipse (mouseX, mouseY, 20, 200);
ellipse (mouseX, mouseY, 200, 20);
fill (200);

}


