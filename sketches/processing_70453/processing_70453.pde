
// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 3-4: Drawing a continuous line
void setup() {
  size(200, 200);
  background(255);
  smooth();
}

void draw() {
  stroke(0);
  strokeWeight(mouseX / 15);
  // Draw a line from previous mouse location to current mouse location.
  // "200 - " makes the line appear on the opposite side of the canvas
  line(200 - pmouseX, 200 - pmouseY, 200 -mouseX, 200 - mouseY);
}

