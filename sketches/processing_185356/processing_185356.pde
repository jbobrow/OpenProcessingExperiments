
//basic uses of setup and draw.
void setup() {
  size(500, 500);
  noStroke();
}
void draw() {
//comment this line out and see what happens!
  background(255, 0, 0);
  fill(0, 0, 255);
  ellipse(mouseX, mouseY, 50, 50);
  fill(0, 200, 20);
  rect(mouseX, mouseY, 50, 50);
  println(mouseX + " <-x and y-> " + mouseY);
}
