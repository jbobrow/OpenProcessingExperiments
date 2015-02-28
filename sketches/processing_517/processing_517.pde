
void setup() {
size(400, 400);
background(200);
}
void draw() {
stroke(200,20,100);
if(mousePressed) {
triangle(mouseX, mouseY, pmouseX, pmouseY,20,30);
}
}

