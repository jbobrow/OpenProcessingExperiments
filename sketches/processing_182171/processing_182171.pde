
void setup() {
size(300,300);
}
 
void draw() {
 stroke(mouseX, mouseY, mouseX);
line(0, 0, mouseX, mouseY);
}

