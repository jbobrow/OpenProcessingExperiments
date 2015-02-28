
// Learning Processing Ex. 3-5

void setup() {
  println("Thanks, Shiffman.");
  size(400, 400);
}

void draw() {
  fill(mouseX + 100);
  ellipse(mouseX, mouseY, 100, 100);
  fill(mouseY + 50);
  ellipse(mouseX - 20, mouseY - 20, 20, 20);
  ellipse(mouseX + 20, mouseY - 20, 20, 20);
  arc(mouseX, mouseY + 10, 80, 60, 0, PI);
}
