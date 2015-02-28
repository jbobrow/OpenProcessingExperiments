
// Learning Processing Ex. 3-7
// "The forumla for calculating the speed of the mouse's
// horizontal motion is the absoltue value of the difference
// between mouseX and pmouseX" (Shiffman, 2008).

void setup() {
  size(500, 200);
  background(255);
}

void draw() {
  stroke(abs(mouseY - pmouseY));
  strokeWeight(abs(mouseX - pmouseX));
  line(pmouseX, pmouseY, mouseX, mouseY);
}
