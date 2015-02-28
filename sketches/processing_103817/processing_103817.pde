
void setup() {
    size(1000, 250);
    smooth();
}

void draw() {
    if(mousePressed) {
        fill(42);
        ellipse(mouseX, mouseY, 10, 10);
    }
}
