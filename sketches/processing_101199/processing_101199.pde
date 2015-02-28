
// Learning Processing Ex. 3-3

void setup() {
  println("Thanks, Shiffman.");
  size(200, 200);
}

void draw() {
  background(255);
  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(mouseX, mouseY, 50, 50);
}
