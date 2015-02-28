
//Kevin Chen

int circle_x = 250;
int circle_y = 250;
int circle_radius = 100;
int circle_x_speed = 100;
int circle_y_speed = 100;

int circle_0_x = 250;
int circle_0_y = 250;
int circle_0_radius = 50;
int circle_0_x_speed = 50;
int circle_0_y_speed = 50;

int circle_1_x = 250;
int circle_1_y = 250;
int circle_1_radius = 25;
int circle_1_x_speed = 25;
int circle_1_y_speed = 25;

int circle_2_x = 250;
int circle_2_y = 250;
int circle_2_radius = 10;
int circle_2_x_speed = 10;
int circle_2_y_speed = 10;

int circle_3_x = 250;
int circle_3_y = 250;
int circle_3_radius = 5;
int circle_3_x_speed = 5;
int circle_3_y_speed = 5;

void setup() {
  size (500,500);
}

void draw() {
  background (random (255));
  fill (random (255), random (255), random (255));
  stroke (random (255), random (255), random (255));
  strokeWeight (5);
  
  //movement
  circle_x = circle_x + circle_x_speed;
  circle_y = circle_y + circle_y_speed;
  
  circle_0_x = circle_0_x + circle_0_x_speed;
  circle_0_y = circle_0_y + circle_0_y_speed;
  
  circle_1_x = circle_1_x + circle_1_x_speed;
  circle_1_y = circle_1_y + circle_1_y_speed;
  
  circle_2_x = circle_2_x + circle_2_x_speed;
  circle_2_y = circle_2_y + circle_2_y_speed;
  
  circle_3_x = circle_3_x + circle_3_x_speed;
  circle_3_y = circle_3_y + circle_3_y_speed;
  
  //left or right, change direction
  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) {
    circle_x_speed = -circle_x_speed;
  };
  if ( (circle_0_x + circle_0_radius > width) || (circle_0_x - circle_0_radius < 0) ) {
    circle_0_x_speed = -circle_0_x_speed;
  };
  if ( (circle_1_x + circle_1_radius > width) || (circle_1_x - circle_1_radius < 0) ) {
    circle_1_x_speed = -circle_1_x_speed;
  };
  if ( (circle_2_x + circle_2_radius > width) || (circle_2_x - circle_2_radius < 0) ) {
    circle_2_x_speed = -circle_2_x_speed;
  };
  if ( (circle_3_x + circle_3_radius > width) || (circle_3_x - circle_3_radius < 0) ) {
    circle_3_x_speed = -circle_3_x_speed;
  };
  
  //top or bottom, change direction
  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) {
    circle_y_speed = -circle_y_speed;
  };
  if ( (circle_0_y + circle_0_radius > height) || (circle_0_y - circle_0_radius < 0) ) {
    circle_0_y_speed = -circle_0_y_speed;
  };
  if ( (circle_1_y + circle_1_radius > height) || (circle_1_y - circle_1_radius < 0) ) {
    circle_1_y_speed = -circle_1_y_speed;
  };
  if ( (circle_2_y + circle_2_radius > height) || (circle_2_y - circle_2_radius < 0) ) {
    circle_2_y_speed = -circle_2_y_speed;
  };
  if ( (circle_3_y + circle_3_radius > height) || (circle_3_y - circle_3_radius < 0) ) {
    circle_3_y_speed = -circle_3_y_speed;
  };
  
  //draw ellipse
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
  ellipse(circle_0_x, circle_0_y, circle_0_radius*2, circle_0_radius*2);
  ellipse(circle_1_x, circle_1_y, circle_1_radius*2, circle_1_radius*2);
  ellipse(circle_2_x, circle_2_y, circle_2_radius*2, circle_2_radius*2);
  ellipse(circle_3_x, circle_3_y, circle_3_radius*2, circle_3_radius*2);

};

