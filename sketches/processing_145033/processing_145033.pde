
// David Mrugala

void setup() {
  size(600, 600);
  colorMode(RGB);
}

void draw() {
  background(37,90,96);

  noStroke();

  translate(width/2, height/2);
  for (int i=0; i<360; i+=10) {
    pushMatrix();
    rotate(radians(i));
    fill(234,248,171,150);
    arc(0, 0, mouseX, mouseY, 0, PI);
    popMatrix();
  }
}

