
void setup() {
size(383, 500);

}

void draw() {
PImage luke = loadImage("luke.jpg");

tint(mouseX-mouseY, mouseX, mouseY);
image(luke, 0, 0);
}

