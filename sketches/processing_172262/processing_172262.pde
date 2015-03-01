
void setup() {
    size(480, 120);
    smooth();
}

void draw() {
    if (mousePressed) {
        fill(0,255,0);
    }
    else {
        fill(255,152,010);
    }
    ellipse(mouseX, mouseY, 80, 80);
}


