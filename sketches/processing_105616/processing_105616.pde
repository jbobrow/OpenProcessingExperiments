
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  if (mousePressed) {
    myQuietCreature();
  } else {
    myLoudCreature();
  }
}
void myQuietCreature() {
  background(0, 0, 0);
  ellipse(mouseX, mouseY, 150, 150);
  //fill(255, 0,0);
  fill(255, 0, 0);
  ellipse(mouseX-40, mouseY-20, 20, 20);
  fill(255, 0, 0);
  ellipse(mouseX+50, mouseY-20, 20, 20);
  fill(255);
  triangle(mouseX+5, mouseY+70, mouseX+60, mouseY+160, mouseX-50, mouseY+160);
}
void myLoudCreature() {
  background(0,0,0);
  fill(255, 0, 0);
  ellipse(mouseX-100, mouseY-80, 80, 80);
}
