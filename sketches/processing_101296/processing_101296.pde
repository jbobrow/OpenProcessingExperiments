
// Learning Processing Ex. 3-5

void setup() {
  println("Hey spoody.");
  size(700, 700);
}

void draw() {
  fill(mouseX + 50);
  ellipse(mouseX, mouseY, 300, 400);
  fill(mouseY + 50);
  ellipse(mouseX - 20, mouseY - 20, 20, 20);
  ellipse(mouseX + 20, mouseY - 20, 20, 20);
  arc(mouseX, mouseY + 10, 80, 80, 0, PI);
}
