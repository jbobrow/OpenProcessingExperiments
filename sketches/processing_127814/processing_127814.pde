
void setup() {
size(400, 400);
smooth();
}
void draw() {
if (mousePressed) {
fill(#FFA2A2);
} else {
fill(#B6E3FA); 
}
rect(mouseX, mouseY, 80, 80);
}
