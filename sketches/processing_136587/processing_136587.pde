
//vanishingPoint, jeg Sandbox #1
/*Using a for loop to distribute and anchor lines to the edges of the canvas.
  The other side of the line is linked to the cursor (mouseX, mouseY) values.
*/

void setup() {
  size(500, 500);
  smooth(8);
  background(255);
}

void draw() {
  fill(255, 60);
  rect(0, 0, width, height);
  for (int i = 0; i <= width; i = i + 20) {
    line(i, height, mouseX, mouseY);
    line(width, i, mouseX, mouseY);
    line(i, 0, mouseX, mouseY);
    line(0, i, mouseX, mouseY);
  }
}



