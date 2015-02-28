
void setup() {
size(480, 300);
background(255);
smooth();
}
void draw() {
if (mousePressed) {
fill(0);
} else {
fill(255);
}
line(mouseX, mouseY, 80, 80);
}

