
void setup() {
size(300,300);
background(54, 255, 255);
}
 
void draw() {
stroke(mouseX, mouseY);
line(0, 0, mouseX, mouseY);
}
