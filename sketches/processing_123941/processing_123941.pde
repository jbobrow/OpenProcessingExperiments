
float circle_x = 0;

void setup() {
  size (500,500);
  
  noStroke();
  fill(#666699);
}
void draw() {
  background(#996699);
  
  ellipse(circle_x,50, 50, 50);
  
  circle_x = circle_x + 1;
}


