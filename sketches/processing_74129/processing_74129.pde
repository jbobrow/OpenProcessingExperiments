
void setup() {
  size(400, 400, P2D);
  background(100);

  smooth(8);
}

void draw() {

  if (mousePressed) {
    if (frameCount%2==0) {
      fill(0);
      background(255);
      ellipse(mouseX, mouseY, 100, 100);
    } 
    else {
      fill(255);
      background(0);
      ellipse(mouseX, mouseY, 100, 100);
    }
  }
  else {

    background(255);

    fill(0);
    ellipse(mouseX, mouseY, 100, 100);
  }
}
