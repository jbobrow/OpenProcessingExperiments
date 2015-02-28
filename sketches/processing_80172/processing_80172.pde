
float y = 0.0;   // y position variable

void setup() {
  size(100, 100);
  smooth();
  fill(0);
}
void draw() {
  background(204);         // draw background
  ellipse(50, y, 70, 70);  // get y position
  y += 0.5;                // add 0.5 to y
}


