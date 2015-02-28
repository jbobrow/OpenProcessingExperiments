
void setup() {
size(500, 350);
smooth();
}
void draw() {
if (mousePressed) {
fill(mouseX, 56, mouseY);
} else {
fill(#CC0000);
}
rect(mouseX, mouseY, 80, 80);
}


