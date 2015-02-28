
void setup () {
  size (1200, 860);
  noSmooth();
  background(125, 15, 0);
}

void draw() {
  if (mousePressed) {
    fill(58);
    stroke(250, 25, 1);
    rect(mouseX, mouseY, 27, 59);
  }else{
    fill(225);
    stroke(27);
  ellipse(mouseX, mouseY, 180, 80);
}
rect(mouseX, mouseY, 0, 20);
}

    


