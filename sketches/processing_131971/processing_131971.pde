
void setup() {
   size(500, 500);
   background(255);
}
void draw() {
    fill(0);
    if(mousePressed) {
        rect(mouseX, mouseY, 10, 10)
    }
}
