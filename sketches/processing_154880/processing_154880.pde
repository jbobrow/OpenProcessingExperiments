
/* Example 8.1
Recursive Circles 1
The Nature of Code
*/

void setup() {
size(400,400);
smooth();
}
void draw() {
background(255);
drawCircle(width/2,height/2,200); // calls function and positions the starting outer circle
}

void drawCircle(float x, float y, float radius) {
  stroke(0);
  noFill();
  ellipse(x, y, radius, radius);
  if (radius > 8) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
    drawCircle(x, y + radius/2, radius/2);
    drawCircle(x, y - radius/2, radius/2);
  }
}
