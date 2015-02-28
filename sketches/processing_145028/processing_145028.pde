
// David Mrugala

void setup() {
  size(600, 600);
  colorMode(RGB);
  //noLoop();
}

void draw() {
  background(255);

  noFill();
  strokeCap(CORNER);
  strokeWeight(1);
  stroke(0, 100);

  translate(width/2, height/2);
  for (int i=0; i<360; i++) {
    pushMatrix();
    rotate(radians(i));
    arc(0, 0, mouseX, mouseY, 0, PI);
    popMatrix();
  }
}

