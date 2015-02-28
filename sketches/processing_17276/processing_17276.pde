
// Example 3-4: Drawing a continuous line
void setup() {
  size(400, 400);
  background(255);
  smooth();
}

void draw() {
//stroke(abs(mouseX-pmouseX-100));
  // Draw a line from previous mouse location to current mouse location.
  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(abs(mouseX-pmouseX), 25, 120, 50);
  strokeWeight(abs(mouseX-pmouseX));
   
}

