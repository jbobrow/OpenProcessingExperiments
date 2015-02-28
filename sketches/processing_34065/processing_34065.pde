

void setup() {
size(600, 600);
background (226, 242, 127);
smooth();
}
void draw() {
if (mousePressed) {
  rect (mouseX, mouseY, 80, 80);
fill(178, 110, 22);
} else {
fill(18, 219, 170);
}
stroke (5, 24, 62);
ellipse(mouseX, mouseY, 80, 80);
rect (mouseX, mouseY, 40, 40);
ellipse(mouseX, mouseY, 30, 10);


}


