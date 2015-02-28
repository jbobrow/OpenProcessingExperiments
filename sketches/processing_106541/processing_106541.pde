
void setup() {
    size(255,255);
}

void draw() {
    fill(mouseX, mouseY, mouseX/255);
    ellipse(mouseX,mouseY,20,20);
}
