
//click to reset the circle to where the mouse is
float circle_x = 230.4;
float circle_y = 140.8;
float circle_speed_x = -3;
float circle_speed_y = -5;
void setup() {
  size( 700, 400);
}
void draw() {
  background(100, 180, 0);
  circle_x = circle_x + circle_speed_x;
  circle_y = circle_y - circle_speed_y;
  ellipse( circle_x, circle_y, 90, 90);
}
void mousePressed() {
  //if mouse is pressed
  //make the circle come back onto the screen
  circle_x = mouseX;
  circle_y = mouseY;
}
