
void setup() {
size(300,300);
background(0);
}
 
void draw() {
stroke(mouseX, mouseY,300, 255);
line(0, 0, mouseX, mouseY);
}
