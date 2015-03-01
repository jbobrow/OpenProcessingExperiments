
void setup() {
  size(300, 800);
  background(255);
  ellipseMode(RADIUS);
}

void draw() {
  if (mousePressed) {
    noStroke();
    fill(#FF0000, random(150));
    ellipse(mouseX, mouseY, random(60), random(60));
  }

  if (keyPressed == true && key == 's') {
    saveFrame("bloodStain.jpg");
  }

  if (keyPressed == true && key == 'r') {
    background(255);
  }
}


