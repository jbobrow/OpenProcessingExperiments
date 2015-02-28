
//Chelsea Domaleski//
//Creative Computing//
//Moving Circle Homework//
//September 24, 2012//

int circle_x = 500;
int circle_y = 500;
int circle_radius = 450;
int circle_x_speed = 1;
int circle_y_speed = 1;
  
void setup() {
  size(500, 500);
};
void draw() {
  background(34, 213, 254);
  fill(255, 169, 74);
  ellipse(random(width), random(height), 300, 300);
  //

  circle_x = circle_x + circle_x_speed;
  if ((circle_x + circle_radius > width) || (circle_x - circle_radius < 0)) {  //move other way
  //
    circle_x_speed = circle_x_speed * 10;    //
  };
  //
 
  circle_y = circle_y + circle_y_speed;//
  if ((circle_y + circle_radius > height) || (circle_y - circle_radius < 0)) {
      //
    circle_y_speed = circle_y_speed * 10;
    //

  }
};


