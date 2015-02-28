
void setup () {
  size(1280, 720);
  colorMode(HSB, height, height, height, height);
  noSmooth();
  background(#FFFFFF);
}

void draw () {
  if (mousePressed) {
    background(#FFFFFF);
    stroke(50);
  }
  else {
    stroke (255);
  }
  ellipse(mouseX, mouseY, 30, 30);
  fill(mouseY, height, height);
}


