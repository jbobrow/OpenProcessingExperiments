
// define variables for x-Position, y-Position
float x = 200;
float y = 200;

// setup for initialization
void setup() {
  size(400, 400);
}

// draw is being called continuously
void draw() {
  // redraw background every frame
  background(0);
  
  // draw a circle at x-Position and y-Position
  ellipse( x, y, 20, 20);
  
  // 1. calculate the difference to mouse
  // 2. divide that by 50
  // 3. add the result to x-Position and y-Position
  x = (mouseX - x) / 50 + x;
  y = (mouseY - y) / 50 + y;
}
