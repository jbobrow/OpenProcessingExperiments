
void setup() {
size(700, 500);
background(0,150,250);
}
void draw() {
stroke(0,50);
strokeWeight(4);
smooth();
// Draw if mouse is pressed
if (mousePressed) {
line(pmouseX, pmouseY, mouseX, mouseY);
}
}
