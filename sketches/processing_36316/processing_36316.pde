
void setup() {
  size(300, 300);
  smooth();
}


void draw() {
  background(0, 0, 300);
  if (mousePressed) {//this changes the face expression
    background(216, 2, 6);
    fill(170, 300, 300);
    ellipse(mouseY, mouseX, 50, 50);
    fill(0, 0, 300);
    ellipse(mouseY-10, mouseX-10, 10, 10);
    ellipse(mouseY+10, mouseX-10, 10, 10);
    fill(300, 0, 0);
    ellipse(mouseY-10, mouseX-10, 5, 5);
    ellipse(mouseY+10, mouseX-10, 5, 5);
    ellipse(mouseY, mouseX+10, 10, 10);
  }
  else {
    background(2, 216, 18);
    fill(170, 300, 300);
    ellipse(mouseY, mouseX, 50, 50);
    fill(300, 0, 0);
    ellipse(mouseY-10, mouseX-10, 10, 10);
    ellipse(mouseY+10, mouseX-10, 10, 10);
    fill(0, 0, 300);
    ellipse(mouseY-10, mouseX-10, 5, 5);
    ellipse(mouseY+10, mouseX-10, 5, 5);
    line(mouseY-5, mouseX+10, mouseY+5, mouseX+10);
  }
  //these lines make the crosshairs
  line(mouseX, mouseY-20, mouseX, mouseY+20);
  line(mouseX-20, mouseY, mouseX+20, mouseY);
  noFill();
  ellipse(mouseX, mouseY, 10, 10);
}


