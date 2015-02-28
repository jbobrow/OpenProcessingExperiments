

void setup() {
size(600, 600);
smooth();
}
void draw() {
if (mousePressed) {
fill(242,12,39);
} else {
fill(12,190,242);
}
ellipse(mouseX, mouseY, 100, 400);}

