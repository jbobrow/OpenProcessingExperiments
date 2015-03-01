
float circle_x = 550;
float circle_y = 200;
float circle_speed_x = -.5;
float circle_speed_y = -4;
void setup() {
  size(700, 400);
}
void draw() {
  background(100, 238, 255);
  circle_x = circle_x + circle_speed_x;
  circle_y = circle_y + circle_speed_y;
  noStroke();
  fill(circle_y, circle_x, circle_y);
  ellipse(circle_x, circle_y, 60, 60);

  //if the circle goes off screen
  //put circle on screen
  //if circle_y is negative

  if (circle_y < 0) {
    circle_speed_y = 4; //speed once it bounces off the top
  }

  // if circle_y is off the bottom of the screen
  // if circle_y is greater than the height 
  if (circle_y > height) {
    circle_speed_y = -4;
  }
  //if the circle goes off the left side
  //put circle back on screen(positive)
  // if circle_x is positive

  if (circle_x < 0) {
    circle_speed_x = 5;
  }

  // if the circle goess off the right side of the screen
  //make it bounce back
  //if circle_x is negative

  if (circle_x > width ) {
    circle_speed_x = -5;
    
  
  }
}


