
float circle_x = 100;
float circle_y = 200;
float circle_speed_x = 4;
float circle_speed_y = 6;
void setup() {
  size(600, 400);
}
void draw() {
  noStroke();
  background(211, 250, 209);
   
  circle_x = circle_x + circle_speed_x;
  circle_y = circle_y + circle_speed_y;

  ellipse(circle_x, circle_y, 50, 50);
 
  if (circle_x > width) {
    circle_speed_x = circle_speed_x * -1;
    noStroke();
    fill(185, 229, 255);

  }
  if (circle_x < 0) {
    circle_speed_x = circle_speed_x * -1;
    noStroke();
    fill(254, 255, 224);
  }
  if (circle_y > height) {
    circle_speed_y = circle_speed_y * -1;
    noStroke();
    fill(250, 209, 227);
  }
  if (circle_y < 0) {
    circle_speed_y = circle_speed_y * -1;
    noStroke();
    fill(226, 185, 255);
  }
}



