
void setup() {
  noCursor();
  size(800, 800);
  background(0);
  colorMode(HSB);
}

void draw() {
  fill (0);
  if (mousePressed == true) {
    background(67, 240, 247);


    ellipse(mouseX, mouseY, pmouseY, pmouseX);
  } else { 
    background(0);
    fill(random(160),255,255);
    ellipse (mouseX, mouseY, pmouseX, pmouseY);
  }
}
