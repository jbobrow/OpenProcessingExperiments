
void setup() {
  size(200, 200);
  background(255);

}
void draw() {
  stroke(0);
  fill(175);
  rectMode(CENTER);
  rect(mouseX,mouseY, 50, 50);
}

// we don't see a trail when the background is moved to the draw, because when the mouse moves the rectangle, the background is kept instead of moved along with the rectangele, allowing it to stay and keep a record of the rectangle's movements.


