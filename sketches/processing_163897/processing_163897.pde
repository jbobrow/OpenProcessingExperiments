
void setup() {
  size(1280, 720);
  smooth();

}

void draw() {
  smooth();
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  noStroke();
  ellipse(mouseX, mouseY, 60, 60);
}


