
int circ = 0;

void setup() {
  size(300, 300);
  fill(0, 100);
  smooth();
  noStroke();
}

void draw() {
  background(255);
  fill(circ);
  ellipse(mouseX, mouseY, 15, 15);
}
 
void mouseClicked() {
  if (circ == 0) {
    circ = 255;
  } else {
    circ = 0;
  }
}

