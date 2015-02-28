
void setup() {
size(300, 300);
background(0);
smooth();
}
void draw() {
if (mousePressed) {
fill(mouseX,5, mouseY);
} else {
fill(#000099);
}
ellipse(mouseX, mouseY, 80, 80);
}


