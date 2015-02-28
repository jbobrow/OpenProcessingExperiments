
//keanferin
//in class9-21


int circle_x = 50;
int circle_y = 40;
int circle_radius = 30;
int circle_x_speed = 4;
int circle_y_speed = 7;
Boolean move_circle = false;



void setup() {
  size(500, 500);
}



void draw() {
  background(300);
  //moving the circle


  //if it reaches an edge change direction
  //if circle_x reaches width
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);

  if (mousePressed == true) {
    move_circle = true;
  };

  circle_x = circle_x + circle_x_speed; 
  circle_y = circle_y + circle_y_speed;
  //this could be anything, as it determines speed, hence circle_speed
  //draw ellipse that you will move

  if ( (circle_x + circle_radius > width) || (circle_x - circle_radius < 0) ) {

    circle_x_speed = -circle_x_speed;
  };

  if ( (circle_y + circle_radius > height) || (circle_y - circle_radius < 0) ) {

    circle_y_speed = -circle_y_speed;
  }

  //if it reaches an edge change direction
  //if circle_x reaches width
  ellipse(circle_x, circle_y, circle_radius*2, circle_radius*2);
}
