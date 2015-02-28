
void setup() {
size(500, 500);
smooth();
}

void draw() {
if (mousePressed) {
stroke(0);
} else {
stroke(255);
}
line(mouseX, mouseY, 280, 280);
}


