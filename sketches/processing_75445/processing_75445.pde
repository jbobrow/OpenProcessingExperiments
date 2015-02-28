
void setup() {
size(420, 120) ;
}

void draw() {
if (mousePressed) {
fill(0);
} else{
fill (255);
}
ellipse(mouseX, mouseY, random(50,150), 80);
}
