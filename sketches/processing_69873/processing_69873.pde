
//ben norskov
//creative computing week 3
//circle that bounces off the walls
float circle_x = 145;
float circle_y = 200;
float circle_speed_x = 2;
float circle_speed_y = 2.3;
void setup() {
  size(500, 400);
};
void draw() {
  background(30);
  
  circle_x = circle_x + circle_speed_x;
  circle_y = circle_y + circle_speed_y;
  
  ellipse(circle_x, circle_y, 50, 50);

  if (circle_x > width) {
    //if the position on the x axis of the circle is at the right edge of the screen
    //turn the speed around. 
    circle_speed_x = circle_speed_x * -1;
  };
  if (circle_x < 0) {
    //0 is the left edge of the screen
    circle_speed_x = circle_speed_x * -1;
  };
  if (circle_y > height) {
    //if the position on the x axis of the circle is at the right edge of the screen
    //turn the speed around. 
    circle_speed_y = circle_speed_y * -1;
  };
  if (circle_y < 0) {
    //0 is the left edge of the screen
    circle_speed_y = circle_speed_y * -1;
  };
  println(circle_x);
};
