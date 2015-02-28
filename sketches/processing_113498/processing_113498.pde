
float circle_x = 300;
float circle_y = 20;
float move_x = 4;
float move_y = -4;

void setup() {
  size(700, 700);
  noStroke();
}
void draw() {
  background(#8FD8D8);
  ellipse(circle_x, circle_y, 140, 140);
  circle_x = circle_x + move_x;
  circle_y = circle_y + move_y;
  
  if(circle_x > width) {
    circle_x = width;
    move_x = -move_x;
  }
  if(circle_y > height) {
    circle_y = height;
    move_y = -move_y;
  }
  if(circle_x < 0) {
    circle_x = 0;
    move_x = -move_x;
  }
  if(circle_y < 0) {
    circle_y = 0;
    move_y = -move_y;
  }
}
