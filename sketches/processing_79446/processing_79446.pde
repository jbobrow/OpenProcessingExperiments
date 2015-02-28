
//Ben Norskov
//Map Parallax Example
//November 16, 2012

void setup() {
  size(400, 400);
}
void draw() {
  background(200);
  float circle_x = map(mouseX, 0, width, 180, 220);
  ellipse(circle_x, 200, 100, 100);
  
  circle_x = map(mouseX, 0, width, 100, 300);
  ellipse(circle_x, 250, 130, 130);
  
  rect(mouseX, 220, 50, 180);
}
