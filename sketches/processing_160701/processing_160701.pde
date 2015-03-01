
void setup () {
  background(255);
  size(600, 600);
  smooth();
  frameRate(8);
}

void draw() {
  fill(0, 100, 240, 80);
  ellipse(mouseX, mouseY, 10, 10);
  fill(255, 0, 0, 80);
  ellipse(pmouseX, pmouseY, 10, 10);
  line(mouseX, mouseY, pmouseX, pmouseY);
}

void keyPressed() {
  background(255);
}


