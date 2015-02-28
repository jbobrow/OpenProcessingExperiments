
void setup() {
size(400, 400);
background(10,10,150);
}
void draw() {
stroke(200,20,100);
if(mousePressed) {
ellipse(mouseX, mouseY, pmouseX, pmouseY);
}
}

