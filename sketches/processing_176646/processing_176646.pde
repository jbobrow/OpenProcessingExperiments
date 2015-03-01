
void setup () {
size (1,000, 1,000);
smooth();
}
void draw () {
if (mousePressed) {
fill (0);
} else {
fill(255);
}
ellipse(mouseX, mouseY, 80, 80);
}
