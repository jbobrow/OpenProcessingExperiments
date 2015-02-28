
int value = 0;

void setup() {
  size(720, 480);
  background(103, 229, 250);
  noStroke();
}

void draw() {

}
  void mousePressed() {
  //Homer
  fill(89, 79, 217); //Color of Homer's pant's
  rect(mouseX, mouseY+50, 40, 45); //Homer's pants
  fill(245, 245, 245); //Color of Homer's shirt
  rect(mouseX, mouseY, 40, 50); //Homer's shirt
  fill(250, 193, 35); //Color of Homer's face
  rect(mouseX, mouseY-40, 40, 40); //Homer's head
}

