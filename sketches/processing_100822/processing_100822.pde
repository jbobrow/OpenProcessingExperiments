
void setup() {
  size(720, 360);
  background(230);
}

void draw() {
    strokeWeight(1.5);
  stroke(55);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
       fill(255);
     strokeWeight(0.25);
     ellipse(pmouseX,pmouseY,15,15);
  }
}
