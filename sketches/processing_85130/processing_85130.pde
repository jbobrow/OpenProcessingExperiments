
void setup() {
  background (100, 130, 234);
size(500, 500);
smooth();
}
void draw() {
if (mousePressed) {
fill(10);
} else {
fill(255);
}
ellipse(mouseX, mouseY, 100, 100);
}


