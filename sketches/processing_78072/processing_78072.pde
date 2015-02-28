
void setup() {
size(300,200);
background(72,20,32);

}

void draw() {
if (mousePressed) {
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 30, 30);
}

}
