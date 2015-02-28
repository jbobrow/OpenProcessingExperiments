
void setup() {
size(480, 480);
background(254); 
smooth();
}
void draw() {
if (mousePressed) {
 size(480, 480);
background(254);
} else {
line(mouseX, mouseY, 240, 240);
}
}

