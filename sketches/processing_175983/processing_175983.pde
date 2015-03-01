

void setup() {
size (1000, 1000)
background(242,178,200)
smooth();
}
void draw() {
if (mousePressed) {
fill (0);
} else {
stroke(255,200,181)
fill(255,228,181);
}
ellipse(mouseX, mouseY, 80, 80);
}
