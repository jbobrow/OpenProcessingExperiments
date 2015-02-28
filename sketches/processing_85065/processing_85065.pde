

void setup() {
  background (2, 250, 3);
size(600, 600);
smooth();
}
void draw() {
if (mousePressed) {
fill(82, 1, 1);
stroke (123,4,200);
rect (mouseX, mouseY, 30, 10);
} else {
fill(0,23,23);
stroke(0,185,255);
ellipse (mouseX, mouseY, 50,50);
}
rect(mouseX, mouseY, 0,0);
}


