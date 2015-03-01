
void setup() {
size(500, 500);
noStroke();
background(0);
}
void draw() {
if (mousePressed == true) {
fill(135,250,235, 6);
} else {
fill(250,135,160, 4);
}
for (float i = 0; i < 50; i+=.4) {
rect(mouseX + i*i, mouseY, i, i);
}
}


