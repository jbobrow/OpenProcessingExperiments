
void setup() {
size(400, 400);
ellipseMode(CENTER);
noStroke();
fill(0, 102, 153, 204);
}
void draw() {
background(255);
ellipse(width-mouseX, height-mouseY, 100, 100);
ellipse(mouseX, mouseY, 100, 100);
}
