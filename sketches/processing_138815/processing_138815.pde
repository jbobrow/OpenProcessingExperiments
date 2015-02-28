
void setup () {
  size (700, 500);
  background (0);
  frameRate (20);
}

void draw () {
  float circle_size, circle_position_x, circle_position_y;
  circle_size = random (10, 50);
  circle_position_x = random (0, width);
  circle_position_y = random (0, height);
  noStroke();
  fill (circle_position_x, circle_position_y, random(0,255), random (50, 150));
  ellipse (circle_position_x, circle_position_y , circle_size, circle_size);
  
  float rect_size, rect_position_x, rect_position_y;
  rect_size = random (10, 50);
  rect_position_x = random (0, width);
  rect_position_y = random (0, height);
  noStroke();
  fill (rect_position_x, rect_position_y, random(0,255), random (50, 150));
  rect (rect_position_x, rect_position_y , rect_size, rect_size);
}
