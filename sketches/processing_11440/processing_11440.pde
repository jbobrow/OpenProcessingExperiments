
 void setup() {
size(600, 600);
smooth();
}
void draw() {
if (mousePressed) {
fill(132,221,16);
} else {
fill(61,12,122);
}
ellipse(mouseX, mouseY, 80, 80);
ellipse(mouseY, mouseX, 100,100);
}


